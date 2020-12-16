<template>
  <div>
    <Card>
      <dz-table
        :totalCount="stores.scenicspot.query.totalCount"
        :pageSize="stores.scenicspot.query.pageSize"
        :currentPage="stores.scenicspot.query.currentPage"
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
                      v-model="stores.scenicspot.query.kw1"
                      placeholder="输入攻略名搜索..."
                      @on-search="handleSearchScenicspot()"
                    >
                      <Select
                        slot="prepend"
                        v-model="stores.scenicspot.query.auditStaues"
                        @on-change="handleSearchScenicspot"
                        placeholder="审核状态"
                        style="width: 60px"
                      >
                        <Option
                          v-for="item in stores.scenicspot.sources
                            .auditStauesSources"
                          :value="item.value"
                          :key="item.value"
                          >{{ item.text }}</Option
                        >
                      </Select>
                    </Input>
                  </FormItem>

                  <FormItem>
                    <DatePicker
                      type="date"
                      v-model="stores.scenicspot.query.kw3"
                      @on-change="stores.scenicspot.query.kw3 = $event"
                      format="yyyy-MM-dd"
                      placement="top"
                      placeholder="输入发布时间搜索..."
                      style="width: 200px"
                      :confirm="true"
                      :editable="false"
                      @on-ok="handleSearchScenicspot()"
                    ></DatePicker>
                  </FormItem>

                  <FormItem>
                    <Select
                      v-model="stores.scenicspot.query.kw2"
                      style="width: 100px"
                      @on-change="xz"
                      clearable
                      placeholder="通过状态"
                    >
                      <Option
                        v-for="item in this.stores.scenicspot.sources.tonggguo"
                        :value="item.value"
                        :key="item.value"
                        >{{ item.label }}</Option
                      >
                    </Select>
                  </FormItem>
                  <!-- <FormItem>
                    <Select
                      v-model="stores.scenicspot.query.kw"
                      style="width:100px;"
                      @on-change="lx"
                      clearable
                      placeholder="攻略类型"
                    >
                      <Option
                        v-for="item in this.stores.scenicspot.sources.glleixing"
                        :value="item.value"
                        :key="item.value"
                      >{{item.label}}</Option>
                    </Select>
                  </FormItem> -->
                </Form>
              </Col>
              <Col span="8" class="dnc-toolbar-btns">
                <ButtonGroup class="mr3">
                  <Button
                    icon="md-refresh"
                    title="刷新"
                    @click="handleRefresh"
                  ></Button>
                </ButtonGroup>
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
          :data="stores.scenicspot.data"
          :columns="stores.scenicspot.columns"
          @on-selection-change="handleSelectionChange"
          @on-refresh="handleRefresh"
          :row-class-name="rowClsRender"
          @on-page-change="handlePageChanged"
          @on-page-size-change="handlePageSizeChanged"
        >
          <template slot-scope="{ row, index }" slot="auditStaues">
            <Tag :color="renderScore(row.auditStaues).color">{{
              renderScore(row.auditStaues).text
            }}</Tag>
          </template>
          <template slot-scope="{ row, index }" slot="throughStaues">
            <Tag :color="renderScore1(row.throughStaues).color">{{
              renderScore1(row.throughStaues).text
            }}</Tag>
          </template>
          <template slot-scope="{ row, index }" slot="action">
            <Tooltip
              placement="top"
              content="审批"
              :delay="1000"
              :transfer="true"
            >
              <Button
                v-if="row.auditStaues==0"
                type="primary"
                size="small"
                shape="circle"
                icon="md-pricetag"
                @click="handleShow(row)"
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
                @click="handleShow2(row)"
              ></Button>
            </Tooltip>
          </template>
        </Table>
      </dz-table>
    </Card>

    <Drawer
      :title="'审批'"
      v-model="formModel1.opened"
      width="600"
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
          <FormItem label="攻略名称">
            <Input v-model="formModel.fields.title" :readonly="true" />
          </FormItem>
        </Row>
        <Row :gutter="16">
          <FormItem label="攻略内容">
            <Input
              type="textarea"
              :rows="18"
              v-model="formModel.fields.strategyContent"
              :readonly="true"
            />
          </FormItem>
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
        <Row :gutter="16" style="top: 25px">
          <RadioGroup v-model="formModel.fields.throughStaues">
            <Radio label="通过" value="0"></Radio>
            <Radio label="不通过" value="1"></Radio>
          </RadioGroup>
        </Row>
      </Form>
      <div style="margin-top: 100px">
        <Button icon="md-checkmark-circle" type="primary" @click="handshenghe"
          >确认审核</Button
        >
        <Button
          style="margin-left: 8px"
          icon="md-close"
          @click="formModel1.opened = false"
          >取 消</Button
        >
      </div>
    </Drawer>

    <Drawer
      :title="'查看详情'"
      v-model="formModel2.opened"
      width="600"
      :mask-closable="false"
      :mask="false"
      :styles="styles"
    >
      <Form
        v-if="formModel2.opened"
        :model="formModel2.fields"
        ref="formPlan"
        :rules="formModel2.rules"
        label-position="top"
      >
        <Row :gutter="16">
          <FormItem label="攻略名称">
            <Input v-model="formModel2.fields.title" :readonly="true" />
          </FormItem>
        </Row>
        <Row :gutter="16">
          <FormItem label="攻略内容">
            <Input
              type="textarea"
              :rows="18"
              v-model="formModel2.fields.strategyContent"
              :readonly="true"
            />
          </FormItem>
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
        <!-- <Row :gutter="16" style="top: 25px">
          <RadioGroup v-model="formModel.fields.throughStaues">
            <Radio label="通过" value="0"></Radio>
            <Radio label="不通过" value="1"></Radio>
          </RadioGroup>
        </Row> -->
      </Form>
      <div style="margin-top: 100px">
        <Button icon="md-close" @click="formModel2.opened = false"
          >取 消</Button
        >
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
  editggboy,
  getStrategyList,
  createScenicspot,
  loadStrategy,
  editScenicspot,
  deleteScenicspot,
  batchCommand,
  deletetoFile,
} from "@/api/Strategy/Strategy";
import { getToken } from "@/libs/util";
import config from "@/config";
export default {
  name: "Strategy",
  components: {
    Tables,
    DzTable,
  },
  data() {
    let checkNum = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入"));
      } else if (value <= 0) {
        callback(new Error("请输入大于0的数字"));
      } else {
        callback();
      }
    };
    return {
      showdetails: false,
      details: "",
      commands: {
        delete: { name: "delete", title: "删除" },
        recover: { name: "recover", title: "恢复" },
        forbidden: { name: "forbidden", title: "禁用" },
        normal: { name: "normal", title: "启用" },
      },

      uploadList: [],
      defaultList: [],
      actionurl: config.baseUrl.dev + "api/v1/common/common/UpLoadPicture",
      postheaders: "",
      imgName: "",
      loadingStatus: false,
      updisabled: false,
      visible: false,

      vloadingStatus: false,
      vactionurl: config.baseUrl.dev + "api/v1/common/common/UpLoadFile",
      vupdisabled: false,
      vuploadList: [],

      aloadingStatus: false,
      aactionurl: config.baseUrl.dev + "api/v1/common/common/UpLoadFile",
      aupdisabled: false,
      auploadList: [],
      formModel1: {
        opened: false,
      },
      formModel: {
        opened: false,
        title: "创建景点",
        mode: "create",
        selection: [],
        fields: {
          title: "",
          strategyContent: "",
          auditStaues: 0,
          loginName: "",
          photoUrl: "",
          id: "",
          strategyUuid: "",
          throughStaues: "",
          addTime: "",
          addPeople: "",
          strategyUuid: "",
        },
        rules: {},
      },
      formModel2: {
        opened: false,
        title: "创建景点",
        mode: "create",
        selection: [],
        fields: {
          title: "",
          strategyContent: "",
          auditStaues: 0,
          loginName: "",
          photoUrl: "",
          id: "",
          strategyUuid: "",
          throughStaues: "",
          addTime: "",
          addPeople: "",
          strategyUuid: "",
        },
        rules: {},
      },
      stores: {
        scenicspot: {
          query: {
            totalCount: 0,
            pageSize: 20,
            currentPage: 1,
            kw: "",
            Kw1: "",
            Kw2: "",
            Kw3: "",
            isDeleted: 0,
            auditStaues: -1,
            sort: [
              {
                direct: "DESC",
                field: "ID",
              },
            ],
          },
          sources: {
            tonggguo: [
              { value: 0, label: "通过" },
              { value: 1, label: "不通过" },
              { value: 2, label: "暂未审核" },
            ],
            glleixing: [
              { value: 1, label: "游玩攻略" },
              { value: 2, label: "路线推荐" },
            ],
            isDeletedSources: [
              { value: -1, text: "全部" },
              { value: 0, text: "正常" },
              { value: 1, text: "已删" },
            ],
            auditStauesSources: [
              { value: -1, text: "全部" },
              { value: 0, text: "未审核" },
              { value: 1, text: "已审核" },
            ],
          },
          columns: [
            { type: "selection", width: 50, key: "handle" },
            { title: "攻略名称", key: "title" },
            { title: "发布者", key: "loginName" },
            { title: "发布时间", key: "addTime" },
            {
              title: "审核状态",
              key: "auditStaues",
              slot: "auditStaues",
            },
            { title: "通过状态", key: "throughStaues", slot: "throughStaues" },
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
        title: "",
        strategyContent: "",
        auditStaues: 0,
        loginName: "",
        photoUrl: "",
        id: "",
        strategyUuid: "",
        throughStaues: "",
        addTime: "",
        addPeople: "",
        strategyUuid: "",
      },
    };
  },
  computed: {
    formTitle() {
      if (this.formModel.mode === "create") {
        return "新增景点";
      }
      if (this.formModel.mode === "edit") {
        return "编辑景点";
      }
      return "";
    },
    selectedRows() {
      return this.formModel.selection;
    },
    selectedRowsId() {
      return this.formModel.selection.map((x) => x.strategyUuid);
    },
  },
  methods: {
    renderScore(auditStaues) {
      let data = {
        color: "",
        text: "",
      };
      if (auditStaues == 0) {
        data.color = "#FF6600";
        data.text = "未审核";
      }
      if (auditStaues == 1) {
        data.color = "#19be6b";
        data.text = "已审核";
      }
      return data;
    },
    renderScore1(throughStaues) {
      let data = {
        color: "",
        text: "",
      };
      if (throughStaues == 0) {
        data.color = "#0066FF";
        data.text = "通过";
      }
      if (throughStaues == 1) {
        data.color = "#000033	";
        data.text = "不通过";
      }
      if (throughStaues == 2) {
        data.color = "#FF6600	";
        data.text = "暂未审核";
      }
      return data;
    },

    // renderauditStaues(auditStaues) {
    //   let _status = "未审核";
    //   switch (auditStaues) {
    //     case 0:
    //       _status = "未审核";
    //       break;
    //     case 1:
    //       _status = "已审核";
    //       break;
    //   }
    //   return _status;
    // },
    async showUpResult(response, file, fileList) {
      console.log(this.$refs.upload.fileList);
      console.log(1);
      console.log(response);
      console.log(file);
      console.log(fileList);
      this.loadingStatus = false;
      this.updisabled = false;
      if (response.code == "200") {
        this.$Message.success(response.message);
        console.log(this.formModel.fields.picture);
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
      deletetoFile({ filePath: file }).then((res) => {
        if (res.data.code == "200") {
          this.uploadList = this.uploadList.filter((x) => x.name != file);
          this.formModel.fields.picture = this.uploadList
            .map((x) => x.fileName)
            .join(",");
        } else {
          this.uploadList = this.uploadList.filter((x) => x.name != file);
          this.formModel.fields.picture = this.uploadList
            .map((x) => x.fileName)
            .join(",");
          this.$Message.warning(res.data.message);
        }
      });
    },

    async vshowUpResult(e) {
      this.vloadingStatus = false;
      this.vupdisabled = false;
      if (e.code == "200") {
        this.$Message.success(e.message);
        console.log(this.formModel.fields.video);
        if (this.formModel.fields.video != null) {
          if (this.formModel.fields.video.length > 0) {
            this.formModel.fields.video += ",";
          }
          this.formModel.fields.video += e.data.fname;
        } else {
          this.formModel.fields.video = e.data.fname;
        }
        await this.vuploadList.push({
          url: config.baseUrl.dev + e.data.strpath.replace("\\", "/"),
          status: "finished",
          name: e.data.strpath,
          fileName: e.data.fname,
        });
      } else {
        this.$Message.warning(e.message);
      }
    },
    vtoUpResult() {
      //console.log(this.$refs.vupload.fileList);
      //console.log(this.$refs.upload.fileList);
      if (this.$refs.vupload.fileList.length > 1) {
        this.$refs.vupload.fileList.shift();
        // this.$refs.upload.clearFiles();
        // this.$refs.upload.push({})
      }
      this.vloadingStatus = true;
      this.vupdisabled = true;
    },
    vdeleteFile(e) {
      console.log(e);
      console.log(this.formModel.fields.video);
      // if (this.formModel.dFileName != null && this.formModel.dFileName != "") {
      //   deletetoFile({ filename: this.formModel.dFileName }).then(res => {
      //     console.log(res);
      //   });
      // }
    },
    vhandleMaxSize(file) {
      this.$Notice.warning({
        title: "文件过大",
        desc: file.name + "超过20M",
      });
    },
    deletevideo(file) {
      console.log(file);
      console.log(this.vuploadList);
      this.vuploadList = this.vuploadList.filter(
        (x) => x.name != "UploadFiles/Scene/Video/" + file
      );
      this.formModel.fields.video = this.vuploadList
        .map((x) => x.fileName)
        .join(",");
    },
    downloadvideo(file) {
      window.location.href =
        config.baseUrl.dev + "UploadFiles/Scene/Video/" + file;
    },

    async ashowUpResult(e) {
      this.aloadingStatus = false;
      this.aupdisabled = false;
      if (e.code == "200") {
        this.$Message.success(e.message);
        console.log(this.formModel.fields.audio);
        if (this.formModel.fields.audio != null) {
          if (this.formModel.fields.audio.length > 0) {
            this.formModel.fields.audio += ",";
          }
          this.formModel.fields.audio += e.data.fname;
        } else {
          this.formModel.fields.audio = e.data.fname;
        }
        await this.auploadList.push({
          url: config.baseUrl.dev + e.data.strpath.replace("\\", "/"),
          status: "finished",
          name: e.data.strpath,
          fileName: e.data.fname,
        });
      } else {
        this.$Message.warning(e.message);
      }
    },
    atoUpResult() {
      if (this.$refs.aupload.fileList.length > 1) {
        this.$refs.aupload.fileList.shift();
      }
      this.aloadingStatus = true;
      this.aupdisabled = true;
    },
    adeleteFile(e) {
      console.log(e);
      console.log(this.formModel.fields.audio);
      // if (this.formModel.dFileName != null && this.formModel.dFileName != "") {
      //   deletetoFile({ filename: this.formModel.dFileName }).then(res => {
      //     console.log(res);
      //   });
      // }
    },
    ahandleMaxSize(file) {
      this.$Notice.warning({
        title: "文件过大",
        desc: file.name + "超过20M",
      });
    },
    deleteaudio(file) {
      this.auploadList = this.auploadList.filter(
        (x) => x.name != "UploadFiles/Scene/Audio/" + file
      );
      this.formModel.fields.audio = this.auploadList
        .map((x) => x.fileName)
        .join(",");
    },
    downloadaudio(file) {
      window.location.href =
        config.baseUrl.dev + "UploadFiles/Scene/Audio/" + file;
    },

    loadScenicspotList() {
      getStrategyList(this.stores.scenicspot.query).then((res) => {
        console.log(3366);
        console.log(res);
        this.stores.scenicspot.data = res.data.data;
        this.stores.scenicspot.query.totalCount = res.data.totalCount;
      });
    },
    xz(e) {
      this.loadScenicspotList();
    },
    lx(e) {
      this.loadScenicspotList();
    },
    handleSearchScenicspot() {
      this.stores.scenicspot.query.currentPage = 1;
      this.loadScenicspotList();
    },
    handleRefresh() {
      this.stores.scenicspot.query.currentPage = 1;
      this.loadScenicspotList();
    },
    //创建，修改
    handleSubmitPlan() {
      let valid = this.validateForm();
      if (valid) {
        if (this.formModel.mode === "create") {
          this.docreateScenicspot();
        }
        if (this.formModel.mode === "edit") {
          this.doEditPlan();
        }
      }
    },
    handshenghe() {
      console.log(this.formModel.fields);
      if (this.formModel.fields.auditStaues != 1) {
        if (
          this.formModel.fields.throughStaues == "通过" ||
          this.formModel.fields.throughStaues == "不通过"
        ) {
          editggboy(this.formModel.fields).then((res) => {
            if (res.data.code === 200) {
              this.$Message.success(res.data.message);
              this.formModel1.opened = false;
              this.loadScenicspotList();
            } else {
              this.$Message.warning(res.data.message);
            }
          });
        } else {
          this.$Message.warning("请选择审核状态");
        }
      } else {
        this.$Message.warning("已审核,请勿重复审核");
      }
    },

    docreateScenicspot() {
      createScenicspot(this.formModel.fields).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.handleCloseFormWindow();
          this.loadScenicspotList();
        } else {
          this.$Message.warning(res.data.message);
        }
      });
    },
    doEditPlan() {
      editScenicspot(this.formModel.fields).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.handleCloseFormWindow();
          this.loadScenicspotList();
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
          this.loadScenicspotList();
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
      this.doDelete(row.strategyUuid);
    },
    doDelete(ids) {
      if (!ids) {
        this.$Message.warning("请选择至少一条数据");
        return;
      }
      deleteScenicspot(ids).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.loadScenicspotList();
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
      this.doLoadScenicspot(row.strategyUuid);
    },
    handleShow(row) {
      this.formModel1.opened = true;
      this.handleResetFormRole();
      this.doLoadScenicspot(row.strategyUuid);
    },
    handleShow2(row) {
      this.formModel2.opened = true;
      this.handleResetFormRole2();
      this.doLoadScenicspot(row.strategyUuid);
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
      this.vuploadList = [];
      this.auploadList = [];
      //this.$refs["formPlan"].resetFields();
    },
    handleResetFormRole2() {
      this.formModel2.fields = JSON.parse(JSON.stringify(this.initdatacopy));
      this.uploadList = [];
      this.vuploadList = [];
      this.auploadList = [];
      //this.$refs["formPlan"].resetFields();
    },
    doLoadScenicspot(guid) {
      // console.log(111);
      // console.log(guid);
      loadStrategy({ guid: guid }).then((res) => {
        console.log(res);
        this.formModel.fields = res.data.data;
        this.formModel2.fields = res.data.data;
        if (res.data.data.photoUrl != null) {
          let list = res.data.data.photoUrl.split(",");
          for (let i = 0; i < list.length; i++) {
            this.uploadList.push({
              url:
                config.baseUrl.dev +
                "UploadFiles/Traveltips/Strategy/" +
                list[i],
              status: "finished",
              name: "UploadFiles/Traveltips/Strategy/" + list[i],
              fileName: list[i],
            });
          }
        }
      });
    },
    handlePageChanged(page) {
      this.stores.scenicspot.query.currentPage = page;
      this.loadScenicspotList();
    },
    handlePageSizeChanged(pageSize) {
      this.stores.scenicspot.query.pageSize = pageSize;
      this.loadScenicspotList();
    },
  },
  mounted() {
    this.loadScenicspotList();
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
