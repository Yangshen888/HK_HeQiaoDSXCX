<template>
  <div>
    <Card>
      <dz-table
        :totalCount="stores.food.query.totalCount"
        :pageSize="stores.food.query.pageSize"
        :currentPage="stores.food.query.currentPage"
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
                      v-model="stores.food.query.kw"
                      placeholder="输入共享单车点位名称搜索..."
                      @on-search="handleSearchFood()"
                    >
                      <Select
                        slot="prepend"
                        v-model="stores.food.query.isDeleted"
                        @on-change="handleSearchFood"
                        placeholder="删除状态"
                        style="width: 60px"
                      >
                        <Option
                          v-for="item in stores.food.sources.isDeletedSources"
                          :value="item.value"
                          :key="item.value"
                          >{{ item.text }}</Option
                        >
                      </Select>
                      <Select
                        slot="prepend"
                        v-model="stores.food.query.state"
                        @on-change="handleSearchFood"
                        placeholder="发布状态"
                        style="width: 60px"
                      >
                        <Option
                          v-for="item in stores.food.sources.stateSources"
                          :value="item.value"
                          :key="item.value"
                          >{{ item.text }}</Option
                        >
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
                  <Button
                    class="txt-success"
                    icon="md-redo"
                    title="恢复"
                    @click="handleBatchCommand('recover')"
                  ></Button>

                  <Button
                    icon="md-refresh"
                    title="刷新"
                    @click="handleRefresh"
                  ></Button>
                </ButtonGroup>
                <Button
                  v-can="'create'"
                  icon="md-create"
                  type="primary"
                  @click="handleShowCreateWindow"
                  title="新增"
                  >新增</Button
                >
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
          :data="stores.food.data"
          :columns="stores.food.columns"
          @on-selection-change="handleSelectionChange"
          @on-refresh="handleRefresh"
          :row-class-name="rowClsRender"
          @on-page-change="handlePageChanged"
          @on-page-size-change="handlePageSizeChanged"
        >
          <template slot-scope="{ row, index }" slot="state">
            <span>{{ renderState(row.state) }}</span>
          </template>
          <template slot-scope="{ row, index }" slot="action">
            <Poptip
              confirm
              :transfer="true"
              title="确定要删除吗?"
              @on-ok="handleDelete(row)"
            >
              <Tooltip
                placement="top"
                content="删除"
                :delay="1000"
                :transfer="true"
              >
                <Button
                  v-can="'delete'"
                  type="error"
                  size="small"
                  shape="circle"
                  icon="md-trash"
                ></Button>
              </Tooltip>
            </Poptip>
            <Tooltip
              placement="top"
              content="编辑"
              :delay="1000"
              :transfer="true"
            >
              <Button
                v-can="'edit'"
                type="primary"
                size="small"
                shape="circle"
                icon="md-create"
                @click="handleEdit(row)"
              ></Button>
            </Tooltip>

            <Tooltip
              placement="top"
              content="详情"
              :delay="1000"
              :transfer="true"
            >
              <Button
                type="warning"
                size="small"
                shape="circle"
                icon="md-search"
                @click="handleShow(row)"
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
      :mask-closable="false"
      :mask="false"
      :styles="styles"
    >
      <Form
        v-if="formModel.opened"
        :model="formModel.fields"
        ref="formPlan"
        :rules="formModel.rules"
        label-position="top"
      >
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="共享单车点位名称" prop="name">
              <Input
                v-model="formModel.fields.name"
                placeholder="请输入共享单车点位名称"
                style="width: 400px"
              />
            </FormItem>
          </Col>
        </Row>

        <!-- <fieldset>
          <legend class="legend">封面图片(推荐大小370*330)</legend>
          <Row style="padding: 15px">
            <div class="demo-upload-list" v-for="item in coveruploadList">
              <template v-if="item.status === 'finished'">
                <img :src="item.url" />
                <div class="demo-upload-list-cover">
                  <Icon
                    type="ios-eye-outline"
                    @click.native="handleView(item.url)"
                  ></Icon>
                  <Icon
                    type="ios-trash-outline"
                    @click.native="coverhandleRemove(item.name)"
                  ></Icon>
                </div>
              </template>
              <template v-else>
                <Progress
                  v-if="item.showProgress"
                  :percent="item.percentage"
                  hide-info
                ></Progress>
              </template>
            </div>
            <Divider dashed />
            <Upload
              ref="coverupload"
              :show-upload-list="false"
              :default-file-list="coverdefaultList"
              :on-success="covershowUpResult"
              :on-progress="covertoUpResult"
              :format="['jpg', 'jpeg', 'png']"
              :max-size="5120"
              :data="{ fileSavePath: 'Xing' }"
              :on-format-error="coverhandleFormatError"
              :on-exceeded-size="coverhandleMaxSize"
              :before-upload="coverhandleBeforeUpload"
              :headers="postheaders"
              type="drag"
              :action="actionurl"
              style="display: inline-block; width: 58px"
            >
              <div style="width: 58px; height: 58px; line-height: 58px">
                <Icon type="ios-camera" size="20"></Icon>
              </div>
            </Upload>
          </Row>
        </fieldset> -->
        <!-- <Row :gutter="16">
          <Col span="12">
            <FormItem label="介绍" prop="introduction">
              <Input
                v-model="formModel.fields.introduction"
                placeholder="请输入介绍"
                style="width: 400px"
                type="textarea"
                :rows="15"
              />
            </FormItem>
          </Col>
        </Row> -->
        <Row :gutter="16" style="margin-top:20px">
          <Col span="12">
            <FormItem label="所处位置" prop="address">
              <Input
                v-model="formModel.fields.address"
                placeholder="请输入所处位置"
                style="width: 400px"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="经度" prop="lon">
              <Input
                v-model="formModel.fields.lon"
                placeholder="请输入经度"
                style="width: 400px"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="纬度" prop="lat">
              <Input
                v-model="formModel.fields.lat"
                placeholder="请输入纬度"
                style="width: 400px"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="状态" prop="state" label-position="left">
              <i-switch
                size="large"
                v-model="formModel.fields.state"
                :true-value="1"
                :false-value="0"
              >
                <span slot="open">发布</span>
                <span slot="close">保存</span>
              </i-switch>
            </FormItem>
          </Col>
        </Row>
        <fieldset>
          <legend class="legend">图片</legend>
          <Row style="padding: 15px">
            <div class="demo-upload-list" v-for="item in uploadList">
              <template v-if="item.status === 'finished'">
                <img :src="item.url" />
                <div class="demo-upload-list-cover">
                  <Icon
                    type="ios-eye-outline"
                    @click.native="handleView(item.url)"
                  ></Icon>
                  <Icon
                    type="ios-trash-outline"
                    @click.native="handleRemove(item.name)"
                  ></Icon>
                </div>
              </template>
              <template v-else>
                <Progress
                  v-if="item.showProgress"
                  :percent="item.percentage"
                  hide-info
                ></Progress>
              </template>
            </div>
            <Divider dashed />
            <Upload
              ref="upload"
              :show-upload-list="false"
              :default-file-list="defaultList"
              :on-success="showUpResult"
              :on-progress="toUpResult"
              :format="['jpg', 'jpeg', 'png']"
              :max-size="5120"
              :data="{ fileSavePath: 'Xing' }"
              :on-format-error="handleFormatError"
              :on-exceeded-size="handleMaxSize"
              :before-upload="handleBeforeUpload"
              :headers="postheaders"
              type="drag"
              :action="actionurl"
              style="display: inline-block; width: 58px"
            >
              <div style="width: 58px; height: 58px; line-height: 58px">
                <Icon type="ios-camera" size="20"></Icon>
              </div>
            </Upload>
            <!--            <Modal title="查看图片" v-model="visible">-->
            <!--              <img :src="imgName" v-if="visible" style="width: 100%" />-->
            <!--            </Modal>-->
          </Row>
        </fieldset>
      </Form>

      <div style="margin-top: 100px">
        <Button
          icon="md-checkmark-circle"
          type="primary"
          @click="handleSubmitPlan"
          >保 存</Button
        >
        <Button
          style="margin-left: 8px"
          icon="md-close"
          @click="formModel.opened = false"
          >取 消</Button
        >
      </div>
    </Drawer>
    <Drawer
      :title="'详情'"
      v-model="formModel1.opened"
      width="500"
      :mask-closable="false"
      :mask="false"
      :styles="styles"
    >
      <Form
        v-if="formModel1.opened"
        :model="formModel.fields"
        ref="formPlan"
        :rules="formModel.rules"
        label-position="top"
      >
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="共享单车点位名称">
              <Input
                v-model="formModel.fields.name"
                placeholder="请输入共享单车点位名称"
                style="width: 400px"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row>
        <!-- <fieldset>
          <legend class="legend">封面图片</legend>
          <Row style="padding: 15px">
            <div class="demo-upload-list" v-for="item in coveruploadList">
              <template v-if="item.status === 'finished'">
                <img :src="item.url" />
                <div class="demo-upload-list-cover">
                  <Icon
                    type="ios-eye-outline"
                    @click.native="handleView(item.url)"
                  ></Icon>
                </div>
              </template>
              <template v-else>
                <Progress
                  v-if="item.showProgress"
                  :percent="item.percentage"
                  hide-info
                ></Progress>
              </template>
            </div>
          </Row>
        </fieldset> -->
        <!-- <Row :gutter="16">
          <Col span="12">
            <FormItem label="介绍">
              <Input
                v-model="formModel.fields.introduction"
                placeholder="请输入介绍"
                style="width: 400px"
                type="textarea"
                :rows="15"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row> -->
        <Row :gutter="16"  style="margin-top:20px">
          <Col span="12">
            <FormItem label="所处位置">
              <Input
                v-model="formModel.fields.address"
                placeholder="请输入所处位置"
                style="width: 400px"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="经度" prop="lon">
              <Input
                v-model="formModel.fields.lon"
                placeholder="请输入经度"
                style="width: 400px"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="纬度" prop="lat">
              <Input
                v-model="formModel.fields.lat"
                placeholder="请输入纬度"
                style="width: 400px"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="状态" label-position="left">
              <i-switch
                size="large"
                v-model="formModel.fields.state"
                :true-value="1"
                :false-value="0"
                :disabled="true"
              >
                <span slot="open">发布</span>
                <span slot="close">保存</span>
              </i-switch>
            </FormItem>
          </Col>
        </Row>
        <fieldset>
          <legend class="legend">图片</legend>
          <Row style="padding: 15px">
            <div class="demo-upload-list" v-for="item in uploadList">
              <template v-if="item.status === 'finished'">
                <img :src="item.url" />
                <div class="demo-upload-list-cover">
                  <Icon
                    type="ios-eye-outline"
                    @click.native="handleView(item.url)"
                  ></Icon>
                  <!--                  <Icon type="ios-trash-outline" @click.native="handleRemove(item.name)"></Icon>-->
                </div>
              </template>
              <template v-else>
                <Progress
                  v-if="item.showProgress"
                  :percent="item.percentage"
                  hide-info
                ></Progress>
              </template>
            </div>
          </Row>
        </fieldset>
      </Form>
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
  getFoodList,
  createFood,
  loadFood,
  editFood,
  batchCommand,
  deleteFood,
} from "@/api/Walk/Sharing";
import { deletetoFile } from "@/api/common/common";
import { getToken } from "@/libs/util";
import config from "@/config";
export default {
  name: "food",
  components: {
    Tables,
    DzTable,
  },
  data() {
    let validateLon = (rule, value, callback) => {
      if (value !== "" && value !== null) {
        let reg = /^[\-\+]?(0?\d{1,2}\.\d{1,6}|1[0-7]?\d{1}\.\d{1,6}|180\.0{1,6})$/;
        if (!reg.test(value)) {
          callback(new Error("格式错误！范围在-180.0~180.0(小数点至多6位)"));
        }
        callback();
      } else {
        callback(new Error("经度不能为空"));
      }
      callback();
    };
    let validateLat = (rule, value, callback) => {
      if (value !== "" && value !== null) {
        let reg = /^[\-\+]?([0-8]?\d{1}\.\d{1,6}|90\.0{1,6})$/;
        if (!reg.test(value)) {
          callback(new Error("格式错误！范围在-90.0~90.0(小数点至多6位)"));
        }
        callback();
      } else {
        callback(new Error("纬度不能为空"));
      }
      callback();
    };
    return {
      showdetails: false,
      details: "",
      typeList: [
        { value: 0, label: "美食" },
        { value: 1, label: "特产" },
      ],
      commands: {
        delete: { name: "delete", title: "删除" },
        recover: { name: "recover", title: "恢复" },
        forbidden: { name: "forbidden", title: "禁用" },
        normal: { name: "normal", title: "启用" },
      },
      coveruploadList: [],
      coverdefaultList: [],
      coverloadingStatus: false,
      coverupdisabled: false,

      uploadList: [],
      defaultList: [],
      actionurl: config.baseUrl.dev + "api/v1/common/common/UpLoadPicture",
      postheaders: "",
      imgName: "",
      loadingStatus: false,
      updisabled: false,
      visible: false,

      formModel1: {
        opened: false,
      },
      formModel: {
        opened: false,
        title: "创建",
        mode: "create",
        selection: [],
        fields: {
          cover: "",
          name: "",
          title: "",
          introduction: "",
          address: "",
          picture: "",
          lon: "",
          lat: "",
          state: 0,
        },
        rules: {
          name: [
            {
              type: "string",
              required: true,
              message: "请输入共享单车点位名称",
              trigger: "blur",
            },
          ],
          lon: [{ type: "string", required: true, validator: validateLon }],
          lat: [{ type: "string", required: true, validator: validateLat }],
        },
      },
      stores: {
        food: {
          query: {
            totalCount: 0,
            pageSize: 20,
            currentPage: 1,
            kw: "",
            isDeleted: 0,
            state: -1,
            sort: [
              {
                direct: "DESC",
                field: "ID",
              },
            ],
          },
          sources: {
            isDeletedSources: [
              { value: -1, text: "全部" },
              { value: 0, text: "正常" },
              { value: 1, text: "已删" },
            ],
            stateSources: [
              { value: -1, text: "全部" },
              { value: 0, text: "保存中" },
              { value: 1, text: "已发布" },
            ],
          },
          columns: [
            { type: "selection", width: 50, key: "handle" },
            { title: "共享单车点位名称", key: "name", tooltip: true, ellipsis: true },
            { title: "所处位置", key: "address", tooltip: true, ellipsis: true },
            {
              title: "状态",
              key: "state",
              align: "center",
              tooltip: true,
              ellipsis: true,
              minWidth: 70,
              slot: "state",
            },
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
          cover: "",
          name: "",
          title: "",
          introduction: "",
          address: "",
          picture: "",
          lon: "",
          lat: "",
          state: 0,
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
      return "";
    },
    selectedRows() {
      return this.formModel.selection;
    },
    selectedRowsId() {
      return this.formModel.selection.map((x) => x.sharingUuid);
    },
  },
  methods: {
    async covershowUpResult(response, file, fileList) {
      this.coverloadingStatus = false;
      this.coverupdisabled = false;
      if (response.code == "200") {
        this.$Message.success(response.message);
        if (this.formModel.fields.cover != null) {
          if (this.formModel.fields.cover.length > 0) {
            this.formModel.fields.cover += ",";
          }
          this.formModel.fields.cover += response.data.fname;
        } else {
          this.formModel.fields.cover = response.data.fname;
        }
        await this.coveruploadList.push({
          url: config.baseUrl.dev + response.data.strpath.replace("\\", "/"),
          status: "finished",
          name: response.data.strpath,
          fileName: response.data.fname,
        });
      } else {
        this.$Message.warning(response.message);
      }
    },
    covertoUpResult() {
      if (this.$refs.coverupload.fileList.length > 1) {
        this.$refs.coverupload.fileList.shift();
      }
      this.coverloadingStatus = true;
      this.coverupdisabled = true;
    },
    coverhandleFormatError(file) {
      this.$Notice.warning({
        title: "The file format is incorrect",
        desc: "文件: " + file.name + " 不是png,jpg",
      });
    },
    coverhandleMaxSize(file) {
      this.$Notice.warning({
        title: "Exceeding file size limit",
        desc: "文件 " + file.name + " 太大,超过5M.",
      });
    },
    coverhandleBeforeUpload() {
      return true;
    },
    coverhandleRemove(file) {
      this.coveruploadList = this.coveruploadList.filter((x) => x.name != file);
      this.formModel.fields.cover = this.coveruploadList
        .map((x) => x.fileName)
        .join(",");
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
        // console.log(
        //   (this.$refs.upload.fileList[0].name = e.data.dataPath.split("\\")[1])
        // );
        // console.log(this.defaultfilelist);
        // if (this.departmentlist.length >= 1) {
        //   this.defaultfilelist = [
        //     { name: this.formModel.fields.name, url: e.data.path }
        //   ];
        // }
      } else {
        this.$Message.warning(response.message);
      }
    },
    toUpResult() {
      console.log(this.$refs.upload.fileList);
      //console.log(this.$refs.upload.fileList);
      if (this.$refs.upload.fileList.length > 1) {
        this.$refs.upload.fileList.shift();
        // this.$refs.upload.clearFiles();
        // this.$refs.upload.push({})
      }
      this.loadingStatus = true;
      this.updisabled = true;
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
      // const check = this.uploadList.length < 5;
      // if (!check) {
      //   this.$Notice.warning({
      //     title: "Up to five pictures can be uploaded."
      //   });
      // }
      // return check;
      return true;
    },
    handleView(name) {
      this.imgName = name;
      this.visible = true;
      console.log(this.imgName);
    },
    handleRemove(file) {
      // const fileList = this.$refs.upload.fileList;
      // this.$refs.upload.fileList.splice(fileList.indexOf(file), 1);
      this.uploadList = this.uploadList.filter((x) => x.name != file);
      this.formModel.fields.picture = this.uploadList
        .map((x) => x.fileName)
        .join(",");
      // deletetoFile({ filePath: file }).then(res => {
      //   if (res.data.code == "200") {
      //
      //   } else {
      //     this.uploadList = this.uploadList.filter(x => x.name != file);
      //     this.formModel.fields.picture = this.uploadList
      //       .map(x => x.fileName)
      //       .join(",");
      //     this.$Message.warning(res.data.message)
      //   }
      // });
    },

    renderState(state) {
      let _status = "保存中";
      switch (state) {
        case 0:
          _status = "保存中";
          break;
        case 1:
          _status = "已发布";
          break;
      }
      return _status;
    },
    loadFoodList() {
      getFoodList(this.stores.food.query).then((res) => {
        this.stores.food.data = res.data.data;
        this.stores.food.query.totalCount = res.data.totalCount;
        //console.log(this.stores.educaplan.data);
      });
    },
    handleSearchFood() {
      this.stores.food.query.currentPage = 1;
      this.loadFoodList();
    },
    handleRefresh() {
      this.stores.food.query.currentPage = 1;
      this.loadFoodList();
    },
    //创建，修改
    handleSubmitPlan() {
      let valid = this.validateForm();
      if (valid) {
        if (this.formModel.mode === "create") {
          this.docreateFood();
        }
        if (this.formModel.mode === "edit") {
          this.doEditPlan();
        }
      }
    },
    docreateFood() {
      createFood(this.formModel.fields).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.handleCloseFormWindow();
          this.loadFoodList();
        } else {
          this.$Message.warning(res.data.message);
        }
      });
    },
    doEditPlan() {
      editFood(this.formModel.fields).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.handleCloseFormWindow();
          this.loadFoodList();
        } else {
          this.$Message.warning(res.data.message);
        }
      });
    },
    validateForm() {
      let _valid = false;
      this.$refs["formPlan"].validate((valid) => {
        if (!valid) {
          this.$Message.error("请完善表单信息");
        } else {
          _valid = true;
        }
      });
      return _valid;
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
      //addsystemlog("delete","删除年度市级招生方案列表");
    },
    doBatchCommand(command) {
      batchCommand({
        command: command,
        ids: this.selectedRowsId.join(","),
      }).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.loadFoodList();
          this.formModel.selection = [];
        } else {
          this.$Message.warning(res.data.message);
        }
        this.$Modal.remove();
      });
    },
    handleSelectionChange(selection) {
      this.formModel.selection = selection;
    },
    rowClsRender(row, index) {
      if (row.isDeleted) {
        return "table-row-disabled";
      }
      return "";
    },
    //单条删除
    handleDelete(row) {
      this.doDelete(row.sharingUuid);
    },
    doDelete(ids) {
      if (!ids) {
        this.$Message.warning("请选择至少一条数据");
        return;
      }
      deleteFood(ids).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.loadFoodList();
          this.formModel.selection = [];
        } else {
          this.$Message.warning(res.data.message);
        }
      });
    },
    //控制弹出子窗体
    handleOpenFormWindow() {
      this.formModel.opened = true;
    },
    handleCloseFormWindow() {
      this.formModel.opened = false;
    },
    //编辑
    handleEdit(row) {
      this.handleSwitchFormModeToEdit();
      this.handleResetFormRole();
      this.doLoadFood(row.sharingUuid);
    },
    handleShow(row) {
      this.formModel1.opened = true;
      this.handleResetFormRole();
      this.doLoadFood(row.sharingUuid);
    },

    handleShowCreateWindow() {
      this.handleSwitchFormModeToCreate();
      this.handleResetFormRole();
    },
    handleSwitchFormModeToCreate() {
      this.formModel.mode = "create";
      this.handleOpenFormWindow();
    },
    handleSwitchFormModeToEdit() {
      this.formModel.mode = "edit";
      this.handleOpenFormWindow();
    },
    handleSwitchFormModeToShow() {
      this.showdetails = true;
    },
    handleResetFormRole() {
      this.formModel.fields = JSON.parse(JSON.stringify(this.initdatacopy));
      this.uploadList = [];
      this.coveruploadList = [];
      //this.$refs["formPlan"].resetFields();
    },
    doLoadFood(guid) {
      loadFood({ guid: guid }).then((res) => {
        this.formModel.fields = res.data.data;
        // this.formModel.fields.ytype =
        //   this.formModel.fields.ytype == "1" ? "古镇游" : "周边游";
        // console.log(this.formModel.fields);
        if (res.data.data.cover != null && res.data.data.cover != "") {
          let list = res.data.data.cover.split(",");
          for (let i = 0; i < list.length; i++) {
            this.coveruploadList.push({
              url: config.baseUrl.dev + "UploadFiles/Xing/" + list[i],
              status: "finished",
              name: "UploadFiles/Xing/" + list[i],
              fileName: list[i],
            });
          }
        }
        if (res.data.data.picture != null && res.data.data.picture != "") {
          let list = res.data.data.picture.split(",");
          for (let i = 0; i < list.length; i++) {
            this.uploadList.push({
              url: config.baseUrl.dev + "UploadFiles/Xing/" + list[i],
              status: "finished",
              name: "UploadFiles/Xing/" + list[i],
              fileName: list[i],
            });
          }
        }
      });
    },
    handlePageChanged(page) {
      this.stores.food.query.currentPage = page;
      this.loadFoodList();
    },
    handlePageSizeChanged(pageSize) {
      this.stores.food.query.pageSize = pageSize;
      this.loadFoodList();
    },
  },
  mounted() {
    this.loadFoodList();
  },
  created() {
    this.postheaders = {
      Authorization: "Bearer " + getToken(),
      //Accept: "application/json, text/plain, */*"
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
