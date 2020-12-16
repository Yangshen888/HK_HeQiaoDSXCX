<template>
  <div>
    <Card>
      <dz-table
        :totalCount="stores.demo.query.totalCount"
        :pageSize="stores.demo.query.pageSize"
        :currentPage="stores.demo.query.currentPage"
        @on-page-change="handlePageChanged"
        @on-page-size-change="handlePageSizeChanged"
      >
        <div slot="searcher">
          <section class="dnc-toolbar-wrap">
            <Row :gutter="16">
              <Col span="16">
                <Form inline @submit.native.prevent>
                  <FormItem>
                    <Input
                      type="text"
                      search
                      :clearable="true"
                      v-model="stores.demo.query.kw"
                      placeholder="输入名称搜索..."
                      @on-search="handleSearchDispatch()"
                    >
                      <Select
                        slot="prepend"
                        v-model="stores.demo.query.kw1"
                        @on-change="handleSearchDispatch"
                        placeholder="发布状态"
                        style="width:80px;"
                      >
                        <Option
                          v-for="item in stores.demo.sources.isState"
                          :value="item.value"
                          :key="item.value"
                        >{{item.text}}</Option>
                      </Select>
                    </Input>
                  </FormItem>
                </Form>
              </Col>
              <Col span="8" class="dnc-toolbar-btns">
                <ButtonGroup class="mr3">
                  <Button
                    v-can="'delete'"
                    class="txt-danger"
                    icon="md-trash"
                    title="删除"
                    @click="handleBatchCommand('delete')"
                  ></Button>
                  <Button icon="md-refresh" title="刷新" @click="handleRefresh"></Button>
                </ButtonGroup>
                <Button
                  v-can="'create'"
                  icon="md-create"
                  type="primary"
                  @click="handleShowCreateWindow"
                  title="添加"
                >添加</Button>
              </Col>
            </Row>
          </section>
        </div>
        <Table
          slot="table"
          ref="tables"
          :border="false"
          size="small"
          :highlight-row="true"
          :data="stores.demo.data"
          :columns="stores.demo.columns"
          @on-select="handleSelect"
          @on-selection-change="handleSelectionChange"
          @on-refresh="handleRefresh"
          :row-class-name="rowClsRender"
          @on-page-change="handlePageChanged"
          @on-page-size-change="handlePageSizeChanged"
        >
          <template slot-scope="{row,index}" slot="Score">
            <Tag :color="renderScore(row.releaseState).color">{{renderScore(row.releaseState).text}}</Tag>
          </template>
          <template slot-scope="{ row, index }" slot="action">
            <Poptip confirm :transfer="true" title="确定要删除吗?" @on-ok="handleDelete(row)">
              <Tooltip placement="top" content="删除" :delay="1000" :transfer="true">
                <Button v-can="'delete'" type="error" size="small" shape="circle" icon="md-trash"></Button>
              </Tooltip>
            </Poptip>
            <Tooltip placement="top" content="编辑" :delay="1000" :transfer="true">
              <Button
                v-can="'edit'"
                type="primary"
                size="small"
                shape="circle"
                icon="md-create"
                @click="handleEdit(row)"
              ></Button>
            </Tooltip>
            <Tooltip placement="top" content="详情" :delay="1000" :transfer="true">
              <Button
                v-can="'show'"
                type="primary"
                size="small"
                shape="circle"
                icon="md-search"
                @click="handleDetail(row)"
              ></Button>
            </Tooltip>
          </template>
        </Table>
      </dz-table>
    </Card>
    <Drawer
      :title="formTitle"
      v-model="formModel.opened"
      width="500"
      :mask-closable="true"
      :mask="true"
      :styles="styles"
    >
      <Form
        :model="formModel.fields"
        ref="formdispatch"
        :rules="formModel.rules"
        label-position="top"
      >
        <Row :gutter="16">
          <FormItem label="导游姓名" prop="tourGuideName">
            <Input
              v-model.trim="formModel.fields.tourGuideName"
              placeholder="请输入导游姓名"
              :readonly="checkShow()"
            />
          </FormItem>
        </Row>
        <Row :gutter="16">
          <FormItem label="电话号码" prop="phone">
            <Input
              v-model.trim="formModel.fields.phone"
              placeholder="请输入电话号码"
              :readonly="checkShow()"
              :maxlength="11"
            />
          </FormItem>
        </Row>
        <Row :gutter="16" v-show="checkShow()">
          <FormItem label="发布时间" prop="releaseTime">
            <Input
              v-model.trim="formModel.fields.releaseTime"
              placeholder="暂未发布"
              :readonly="checkShow()"
              :maxlength="11"
            />
          </FormItem>
        </Row>
        <Row :gutter="16">
          <FormItem label="状态" prop="releaseState" label-position="left">
            <i-switch
              size="large"
              v-model="formModel.fields.releaseState"
              :true-value="1"
              :false-value="0"
              style="width:65px;"
              :disabled="checkShow()"
            >
              <span slot="open">发布</span>
              <span slot="close">保存</span>
            </i-switch>
          </FormItem>
        </Row>
        <legend class="legend" style="margin-left: -10px;">图片（建议尺寸：370*330）</legend>
        <Row style="padding: 15px">
          <div class="demo-upload-list" v-for="(item,index) in auploadList" :key="index">
            <template v-if="item.status === 'finished'">
              <img :src="item.url" />
              <div class="demo-upload-list-cover">
                <Icon type="ios-eye-outline" @click.native="handleView(item.url)"></Icon>
                <Icon
                  type="ios-trash-outline"
                  @click.native="ahandleRemove(item.name)"
                  v-if="!checkShow()"
                ></Icon>
              </div>
            </template>
            <template v-else>
              <Progress v-if="item.showProgress" :percent="item.percentage" hide-info></Progress>
            </template>
          </div>
          <Divider dashed />
          <Upload
            ref="upload"
            :show-upload-list="false"
            :default-file-list="adefaultList"
            :on-success="ashowUpResult"
            :on-progress="atoUpResult"
            :format="['jpg','jpeg','png']"
            :max-size="5120"
            :data="{fileSavePath:'InfoPicture/TourGuide'}"
            :on-format-error="handleFormatError"
            :on-exceeded-size="handleMaxSize"
            :before-upload="ahandleBeforeUpload"
            :headers="postheaders"
            type="drag"
            :action="aactionurl"
            style="display: inline-block;width:58px;"
            v-if="!checkShow()"
          >
            <div style="width: 58px;height:58px;line-height: 58px;">
              <Icon type="ios-camera" size="20"></Icon>
            </div>
          </Upload>
        </Row>

        <!-- <legend class="legend" style="margin-left: -10px;">相关图片（建议尺寸：530*225）</legend>
        <Row style="padding: 15px">
          <div class="demo-upload-list" v-for="(item,index) in uploadList" :key="index">
            <template v-if="item.status === 'finished'">
              <img :src="item.url" />
              <div class="demo-upload-list-cover">
                <Icon type="ios-eye-outline" @click.native="handleView(item.url)"></Icon>
                <Icon
                  type="ios-trash-outline"
                  @click.native="handleRemove(item.name)"
                  v-if="!checkShow()"
                ></Icon>
              </div>
            </template>
            <template v-else>
              <Progress v-if="item.showProgress" :percent="item.percentage" hide-info></Progress>
            </template>
          </div>
          <Divider dashed />
          <Upload
            ref="upload"
            :show-upload-list="false"
            :default-file-list="defaultList"
            :on-success="showUpResult"
            :on-progress="toUpResult"
            :format="['jpg','jpeg','png']"
            :max-size="5120"
            :data="{fileSavePath:'InfoPicture/TourGuide'}"
            :on-format-error="handleFormatError"
            :on-exceeded-size="handleMaxSize"
            :before-upload="handleBeforeUpload"
            :headers="postheaders"
            type="drag"
            :action="actionurl"
            style="display: inline-block;width:58px;"
            v-if="!checkShow()"
          >
            <div style="width: 58px;height:58px;line-height: 58px;">
              <Icon type="ios-camera" size="20"></Icon>
            </div>
          </Upload>
        </Row> -->
        <FormItem
          label="内容"
          label-position="top"
          prop="content"
          style="margin-left: -10px;margin-top:25px;height: 360px;"
        >
          <quill-editor
            v-model="formModel.fields.content"
            style="height:270px;"
            :disabled="checkShow()"
          ></quill-editor>
        </FormItem>
      </Form>

      <div style="margin-top: 100px">
        <Button
          icon="md-checkpublicitytype-circle"
          type="primary"
          @click="handleSubmitPlan"
          v-show="!checkShow()"
        >保 存</Button>
        <Button style="margin-left: 8px" icon="md-close" @click="formModel.opened = false">取 消</Button>
      </div>
    </Drawer>
    <Modal title="查看图片" v-model="visible">
      <img :src="imgName" v-if="visible" style="width: 100%" />
    </Modal>
  </div>
</template>
<script>
import DzTable from "_c/tables/dz-table.vue";
import Tables from "_c/tables";
import {
  getList,
  GetCreate,
  GetEdit,
  GetShow,
  deleteDepartment,
  batchCommand,
} from "@/api/tourguide/tourGuide";
  import { getToken } from "@/libs/util";
  import config from "@/config";
export default {
  name: "tourGuide",
  components: {
    Tables,
    DzTable,
  },
  data() {
    return {
      uploadList: [],
        defaultList: [],
        actionurl: config.baseUrl.dev + "api/v1/common/common/UpLoadPicture",
        postheaders: "",
        imgName: "",
        loadingStatus: false,
        updisabled: false,
        visible: false,

      auploadList: [],
      adefaultList: [],
      aactionurl: config.baseUrl.dev + "api/v1/common/common/UpLoadPicture",
      apostheaders: "",
      aimgName: "",
      aloadingStatus: false,
      aupdisabled: false,
      avisible: false,

      details: "",
      commands: {
        delete: { name: "delete", title: "删除" },
      },
      formModel: {
        opened: false,
        title: "创建类别",
        mode: "create",
        selection: [],
        fields: {
          tourGuideName: "",
          phone: "",
          releaseState: 0,
          picture: "",
          fmpicture: "",
          content: "",
          tourGuideUuid: "",
        },
        rules: {
          tourGuideName: [
            {
              type: "string",
              required: true,
              message: "请输入导游名称",
              trigger: "blur",
            },
          ],
          phone: [
            {
              type: "string",
              required: true,
              message: "请输入电话号码",
              trigger: "blur",
            },
          ],
        },
      },
      stores: {
        demo: {
          query: {
            totalCount: 0,
            pageSize: 20,
            currentPage: 1,
            kw: "",
            kw1: "",
            isDeleted: 0,
            status: -1,
            sort: [
              {
                direct: "DESC",
                field: "ID",
              },
            ],
          },
          sources: {
            isState: [
              { value: "", text: "全部" },
              { value: "已发布", text: "已发布" },
              { value: "未发布", text: "未发布" },
            ],
          },
          columns: [
            { type: "selection", width: 50, key: "tourGuideUuid" },
            { title: "导游姓名", key: "tourGuideName" },
            { title: "电话号码", key: "phone" },
            { title: "发布时间", key: "releaseTime" },
            { title: "发布状态", key: "releaseState", slot: "Score" },
            {
              title: "操作",
              fixed: "right",
              align: "center",
              width: 150,
              className: "table-command-column",
              slot: "action",
            },
          ],
          data: [],
        },
      },
      styles: {
        height: "calc(100% - 55px)",
        overflow: "auto",
        paddingBottom: "53px",
        position: "static",
      },
      initdatacopy: {
        name: "",
      },
    };
  },
  computed: {
    formTitle() {
      if (this.formModel.mode === "create") {
        return "新增";
      }
      if (this.formModel.mode === "edit") {
        return "编辑";
      }
      if (this.formModel.mode === "show") {
        return "详情";
      }
      return "";
    },
    selectedRows() {
      return this.formModel.selection;
    },
    selectedRowsId() {
      return this.formModel.selection.map((x) => x.tourGuideUuid);
    },
  },
  methods: {
    loadDispatchList() {
      getList(this.stores.demo.query).then((res) => {
        this.stores.demo.data = res.data.data;
        this.stores.demo.query.totalCount = res.data.totalCount;
      });
    },
    handleSelect(selection, row) {},
    //多选
    handleSelectionChange(selection) {
      this.formModel.selection = selection;
    },
    //行样式
    rowClsRender(row, index) {
      if (row.isDeleted) {
        return "table-row-disabled";
      }
      return "";
    },
    //翻页
    handlePageChanged(page) {
      this.stores.demo.query.currentPage = page;
      this.loadDispatchList();
    },
    //显示条数改变
    handlePageSizeChanged(pageSize) {
      this.stores.demo.query.pageSize = pageSize;
      this.loadDispatchList();
    },
    //搜索
    handleSearchDispatch() {
      this.loadDispatchList();
    },
    //刷新
    handleRefresh() {
      this.loadDispatchList();
    },
    //清空
    handleResetFormDispatch() {
      this.$refs["formdispatch"].resetFields();
      this.uploadList = [];
      this.auploadList = [];
    },
    checkShow() {
      return this.formModel.mode === "show";
    },
    renderScore(Score) {
      let data = {
        color: "",
        text: "",
      };
      if (Score == "已发布") {
        data.color = "#5cadff";
        data.text = "已发布";
      }
      if (Score == "未发布") {
        data.color = "#19be6b";
        data.text = "未发布";
      }
      return data;
    },
    validateForm() {
      let _valid = false;
      this.$refs["formdispatch"].validate((valid) => {
        if (!valid) {
          this.$Message.error("请完善表单信息");
        } else {
          _valid = true;
        }
      });
      return _valid;
    },
    //创建，修改
    handleSubmitPlan() {
      let valid = this.validateForm();
      if (valid) {
        let reg = /^[1][3,4,5,7,8][0-9]{9}$/;
        if (!reg.test(this.formModel.fields.phone)) {
          this.$Message.warning("手机号不合法!");
          return;
        }
        if (this.formModel.fields.fmpicture.split(",").length != 1 || this.formModel.fields.fmpicture=="") {
          this.$Message.warning("请上传一张图片!");
          return;
        }
        // if (this.formModel.fields.picture.split(",").length != 3 || this.formModel.fields.picture=="") {
        //   this.$Message.warning("请上传三张相关图片!");
        //   return;
        // }
        if (this.formModel.mode === "create") {
          this.docreateDispatch();
        }
        if (this.formModel.mode === "edit") {
          this.doEditDispatch();
        }
      }
    },
    //添加按钮
    handleShowCreateWindow() {
      this.formModel.mode = "create";
      this.handleResetFormDispatch(); //清空表单
      this.formModel.opened = true;
    },
    //编辑
    handleEdit(row) {
      this.formModel.mode = "edit";
      this.formModel.opened = true;
      this.handleResetFormDispatch(); //清空表单
      this.doLoadData(row.tourGuideUuid);
    },
    //详情显示
    handleDetail(e) {
      this.formModel.mode = "show";
      this.formModel.opened = true;
      this.handleResetFormDispatch(); //清空表单
      this.doLoadData(e.tourGuideUuid);
    },
    //查询当前行信息
    doLoadData(guid) {
      GetShow(guid).then((res) => {
        this.formModel.fields = res.data.data;
        if (res.data.data.fmpicture != null) {
          let alist = res.data.data.fmpicture.split(",");
          for (let i = 0; i < alist.length; i++) {
            this.auploadList.push({
              url:
                config.baseUrl.dev +
                "UploadFiles/InfoPicture/TourGuide/" +
                alist[i],
              status: "finished",
              name: "UploadFiles/InfoPicture/TourGuide/" + alist[i],
              fileName: alist[i],
            });
          }
        }
        // if (res.data.data.picture != null) {
        //   let list = res.data.data.picture.split(",");
        //   for (let i = 0; i < list.length; i++) {
        //     this.uploadList.push({
        //       url:
        //         config.baseUrl.dev +
        //         "UploadFiles/InfoPicture/TourGuide/" +
        //         list[i],
        //       status: "finished",
        //       name: "UploadFiles/InfoPicture/TourGuide/" + list[i],
        //       fileName: list[i],
        //     });
        //   }
        // }
      });
    },
    //添加（保存）
    docreateDispatch() {
      GetCreate(this.formModel.fields).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.formModel.opened = false; //关闭表单
          this.loadDispatchList();
        } else {
          this.$Message.warning(res.data.message);
        }
      });
    },
    //编辑（保存）
    doEditDispatch() {
      GetEdit(this.formModel.fields).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.formModel.opened = false; //关闭表单
          this.loadDispatchList();
        } else {
          this.$Message.warning(res.data.message);
        }
      });
    },
    //单条删除
    handleDelete(row) {
      this.doDelete(row.tourGuideUuid);
    },
    doDelete(ids) {
      if (!ids) {
        this.$Message.warning("请选择至少一条数据");
        return;
      }
      deleteDepartment(ids).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.loadDispatchList();
          this.formModel.selection = [];
        } else {
          this.$Message.warning(res.data.message);
        }
      });
    },
    //批量操作
    handleBatchCommand(command) {
      if (!this.selectedRowsId || this.selectedRowsId.length <= 0) {
        this.$Message.warning("请选择至少一条数据");
        return;
      }
      this.$Modal.confirm({
        title: "操作提示",
        content:
          "<p>确定要执行当前 [" +
          this.commands[command].title +
          "] 操作吗?</p>",
        loading: true,
        onOk: () => {
          this.doBatchCommand(command);
        },
      });
    },
    //右上边删除
    doBatchCommand(command) {
      batchCommand({
        command: command,
        ids: this.selectedRowsId.join(","),
      }).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.loadDispatchList();
          this.formModel.selection = [];
        } else {
          this.$Message.warning(res.data.message);
        }
        this.$Modal.remove();
      });
    },
    async showUpResult(response, file, fileList) {
      this.loadingStatus = false;
      this.updisabled = false;
      if (response.code == "200") {
        this.$Message.success(response.message);
        if (this.formModel.fields.picture != null) {
          if (this.formModel.fields.picture.length > 0) {
            this.formModel.fields.picture += ",";
          }
          this.formModel.fields.picture += response.data.fname;
        } else {
          this.formModel.fields.picture = response.data.fname;
        }
        await this.uploadList.push({
          url: config.baseUrl.dev + response.data.strpath.replace("\\", "/"),
          status: "finished",
          name: response.data.strpath,
          fileName: response.data.fname,
        });
      } else {
        this.$Message.warning(response.message);
      }
    },
    async ashowUpResult(response, file, fileList) {
      this.aloadingStatus = false;
      this.aupdisabled = false;
      if (response.code == "200") {
        this.$Message.success(response.message);
        if (this.formModel.fields.fmpicture != null) {
          if (this.formModel.fields.fmpicture.length > 0) {
            this.formModel.fields.fmpicture += ",";
          }
          this.formModel.fields.fmpicture += response.data.fname;
        } else {
          this.formModel.fields.fmpicture = response.data.fname;
        }
        await this.auploadList.push({
          url: config.baseUrl.dev + response.data.strpath.replace("\\", "/"),
          status: "finished",
          name: response.data.strpath,
          fileName: response.data.fname,
        });
      } else {
        this.$Message.warning(response.message);
      }
    },

    toUpResult() {
      console.log(this.$refs.upload.fileList);
      if (this.$refs.upload.fileList.length > 1) {
        this.$refs.upload.fileList.shift();
      }
      this.loadingStatus = true;
      this.updisabled = true;
    },
    atoUpResult() {
      console.log(this.$refs.upload.fileList);
      if (this.$refs.upload.fileList.length > 1) {
        this.$refs.upload.fileList.shift();
      }
      this.aloadingStatus = true;
      this.aupdisabled = true;
    },

    handleFormatError(file) {
      this.$Notice.warning({
        title: "The file format is incorrect",
        desc: "文件: " + file.name + " 不是png,jpg",
      });
    },
    handleMaxSize(file) {
      this.$Notice.warning({
        title: "Exceeding file size limit",
        desc: "文件 " + file.name + " 太大,超过5M.",
      });
    },
    handleBeforeUpload() {
      return true;
    },
    ahandleBeforeUpload() {
      return true;
    },
    handleView(name) {
      this.imgName = name;
      this.visible = true;
      console.log(this.imgName);
    },
    handleRemove(file) {
      this.uploadList = this.uploadList.filter((x) => x.name != file);
      this.formModel.fields.picture = this.uploadList
        .map((x) => x.fileName)
        .join(",");
    },
    ahandleRemove(file) {
      this.auploadList = this.auploadList.filter((x) => x.name != file);
      this.formModel.fields.fmpicture = this.auploadList
        .map((x) => x.fileName)
        .join(",");
    },
  },
  mounted() {
    this.loadDispatchList();
  },
  created() {
    this.postheaders = {
      Authorization: "Bearer " + getToken(),
    };
  },
};
</script>
<style scoped>
.demo-upload-list {
  display: inline-block;
  width: 120px;
  height: 120px;
  text-align: center;
  line-height: 120px;
  border: 1px solid transparent;
  border-radius: 4px;
  overflow: hidden;
  background: #fff;
  position: relative;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
  margin-right: 4px;
}
.demo-upload-list img {
  width: 100%;
  height: 100%;
}
.demo-upload-list-cover {
  display: none;
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.6);
}
.demo-upload-list:hover .demo-upload-list-cover {
  display: block;
}
.demo-upload-list-cover i {
  color: #fff;
  font-size: 20px;
  cursor: pointer;
  margin: 0 2px;
}
</style>
