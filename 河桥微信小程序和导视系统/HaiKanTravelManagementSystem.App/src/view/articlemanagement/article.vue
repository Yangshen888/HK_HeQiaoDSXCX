<template>
  <div>
    <Card>
      <dz-table
        :totalCount="stores.article.query.totalCount"
        :pageSize="stores.article.query.pageSize"
        :currentPage="stores.article.query.currentPage"
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
                      v-model="stores.article.query.kw"
                      placeholder="输入标题搜索..."
                      @on-search="handleSearchPublicity()"
                    >
                      <Select
                        slot="prepend"
                        v-model="stores.article.query.isDeleted"
                        @on-change="handleSearchPublicity"
                        placeholder="删除状态"
                        style="width:60px;"
                      >
                        <Option
                          v-for="item in stores.article.sources.isDeletedSources"
                          :value="item.value"
                          :key="item.value"
                        >{{item.text}}</Option>
                      </Select>
                      <!-- <Select
                        slot="prepend"
                        v-model="stores.article.query.state"
                        @on-change="handleSearchPublicity"
                        placeholder="发布状态"
                        style="width:60px;"
                      >
                        <Option
                          v-for="item in stores.article.sources.releaseSources"
                          :value="item.value"
                          :key="item.value"
                        >{{item.text}}</Option>
                      </Select>-->
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

                  <Button icon="md-refresh" title="刷新" @click="handleRefresh"></Button>
                </ButtonGroup>
                <Button
                  v-can="'create'"
                  icon="md-create"
                  type="primary"
                  @click="handleShowCreateWindow"
                  title="添加文章"
                >添加文章</Button>
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
          :data="stores.article.data"
          :columns="stores.article.columns"
          @on-selection-change="handleSelectionChange"
          @on-refresh="handleRefresh"
          :row-class-name="rowClsRender"
          @on-page-change="handlePageChanged"
          @on-page-size-change="handlePageSizeChanged"
        >
          <template slot-scope="{row,index}" slot="state">
            <span>{{renderState(row.state)}}</span>
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
            <FormItem label="文章类型" prop="articleTypeUuid">
              <Select
                v-model="formModel.fields.articleTypeUuid"
                placeholder="文章类型"
                style="width: 400px"
              >
                <Option
                  v-for="item in articletypelist"
                  :value="item.articleTypeUuid"
                  :key="item.name"
                >{{item.name}}</Option>
              </Select>
            </FormItem>
          </Col>
        </Row>

        <Row :gutter="16">
          <Col span="12">
            <FormItem label="标题" prop="articleTitle">
              <Input
                v-model.trim="formModel.fields.articleTitle"
                placeholder="请输入标题"
                style="width: 400px"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="发布时间" prop="releaseTime">
              <Date-picker
                :value="formModel.fields.releaseTime"
                @on-change="formModel.fields.releaseTime=$event"
                type="datetime"
                format="yyyy-MM-dd HH:mm:ss"
                placeholder="选择发布时间"
                style="width: 400px"
              ></Date-picker>
            </FormItem>
          </Col>
        </Row>

        <FormItem label="内容" label-position="top" prop="articleName">
          <quill-editor v-model="formModel.fields.articleName"></quill-editor>
        </FormItem>

        <Row :gutter="16">
          <Col span="12">
            <FormItem label="发布状态" prop="state" label-position="left">
              <i-switch
                size="large"
                v-model="formModel.fields.isRelease"
                :true-value="1"
                :false-value="0"
              >
                <span slot="open">发布</span>
                <span slot="close">未发布</span>
              </i-switch>
            </FormItem>
          </Col>
          <Col span="12">
            <FormItem label="是否推荐" prop="state" label-position="left">
              <i-switch
                size="large"
                v-model="formModel.fields.isRecommend"
              >
                <span slot="open">是</span>
                <span slot="close">否</span>
              </i-switch>
            </FormItem>
          </Col>
        </Row>

        <fieldset>
          <legend class="legend">封面图片(推荐大小370*330)</legend>
          <Row style="padding: 15px">
            <div class="demo-upload-list" v-for="item in uploadList">
              <template v-if="item.status === 'finished'">
                <img :src="item.url" />
                <div class="demo-upload-list-cover">
                  <Icon type="ios-eye-outline" @click.native="handleView(item.url)"></Icon>
                  <Icon type="ios-trash-outline" @click.native="handleRemove(item.name)"></Icon>
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
              :data="{fileSavePath:'Article'}"
              :on-format-error="handleFormatError"
              :on-exceeded-size="handleMaxSize"
              :before-upload="handleBeforeUpload"
              :headers="postheaders"
              type="drag"
              :action="actionurl"
              style="display: inline-block;width:58px;"
            >
              <div style="width: 58px;height:58px;line-height: 58px;">
                <Icon type="ios-camera" size="20"></Icon>
              </div>
            </Upload>
            <!--          <Modal title="查看图片" v-model="visible">-->
            <!--            <img :src="imgName" v-if="visible" style="width: 100%" />-->
            <!--          </Modal>-->
          </Row>
        </fieldset>
      </Form>

      <div style="margin-top: 100px">
        <Button icon="md-checkmark-circle" type="primary" @click="handleSubmitPlan">保 存</Button>
        <Button style="margin-left: 8px" icon="md-close" @click="formModel.opened = false">取 消</Button>
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
            <FormItem label="文章类型">
              <Select
                v-model="formModel.fields.articleTypeUuid"
                placeholder="文章类型"
                style="width: 400px"
                :disabled="true"
              >
                <Option
                  v-for="item in articletypelist"
                  :value="item.articleTypeUuid"
                  :key="item.name"
                >{{item.name}}</Option>
              </Select>
            </FormItem>
          </Col>
        </Row>

        <Row :gutter="16">
          <Col span="12">
            <FormItem label="标题">
              <Input
                v-model="formModel.fields.articleTitle"
                placeholder="请输入标题"
                style="width: 400px"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row>
        <Row style="padding: 15px">
          <Col span="12">
            <FormItem label="发布时间">
              <Input v-model="formModel.fields.releaseTime" :readonly="true" />
            </FormItem>
          </Col>
        </Row>
        <fieldset>
          <legend class="legend">内容</legend>
          <Row style="padding: 15px">
            <div v-html="formModel.fields.articleName">{{formModel.fields.articleName}}</div>
          </Row>
        </fieldset>

        <Row :gutter="16" style="margin-top: 15px">
          <Col span="12">
            <FormItem label="发布状态" label-position="left">
              <i-switch
                size="large"
                v-model="formModel.fields.isRelease"
                :true-value="1"
                :false-value="0"
                :disabled="true"
              >
                <span slot="open">发布</span>
                <span slot="close">未发布</span>
              </i-switch>
            </FormItem>
          </Col>
          <Col span="12">
            <FormItem label="是否推荐" prop="state" label-position="left">
              <i-switch
                size="large"
                v-model="formModel.fields.isRecommend"
                :disabled="true"

              >
                <span slot="open">是</span>
                <span slot="close">否</span>
              </i-switch>
            </FormItem>
          </Col>
        </Row>

        <fieldset>
          <legend class="legend">封面图片</legend>
          <Row style="padding: 15px">
            <div class="demo-upload-list" v-for="item in uploadList">
              <template v-if="item.status === 'finished'">
                <img :src="item.url" />
                <div class="demo-upload-list-cover">
                  <Icon type="ios-eye-outline" @click.native="handleView(item.url)"></Icon>
                  <!--                  <Icon type="ios-trash-outline" @click.native="handleRemove(item.name)"></Icon>-->
                </div>
              </template>
              <template v-else>
                <Progress v-if="item.showProgress" :percent="item.percentage" hide-info></Progress>
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
  getArticleList,
  createArticle,
  loadArticle,
  editArticle,
  batchCommand,
  Articletypelist,
} from "@/api/articlemanagement/article";
import { getToken } from "@/libs/util";
import config from "@/config";
export default {
  name: "article",
  components: {
    Tables,
    DzTable,
  },
  data() {
    return {
      articletypelist: [],
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
        title: "添加文章",
        mode: "create",
        selection: [],
        fields: {
          articleUuid: "",
          articleTitle: "",
          articleTypeUuid: "",
          isRelease: 0,
          releaseTime: "",
          coverPhoto: "",
          articleName: "",
          isRecommend:false,
        },
        rules: {
          articleTitle: [
            {
              type: "string",
              required: true,
              message: "请输入标题",
              trigger: "blur",
            },
          ],
          articleName: [
            {
              type: "string",
              required: true,
              message: "请输入内容",
              trigger: "blur",
            },
          ],
          articleTypeUuid: [
            {
              type: "string",
              required: true,
              message: "请选择类型",
              trigger: "blur",
            },
          ],
          releaseTime: [
            {
              required: true,
              message: "请选择发布时间",
              trigger: "blur",
            },
          ],         
        },
      },
      stores: {
        article: {
          query: {
            totalCount: 0,
            pageSize: 20,
            currentPage: 1,
            kw: "",
            isDeleted: 0,
            isRelease: 0,
            articleUuid: "",
            sort: [
              {
                direct: "DESC",
                field: "ID",
              },
            ],
          },
          sources: {
            articletypelist: [{ articleUuid: "", name: "全部" }],
            isDeletedSources: [
              { value: -1, text: "全部" },
              { value: 0, text: "正常" },
              { value: 1, text: "已删" },
            ],
            releaseSources: [
              { value: -1, text: "全部" },
              { value: 0, text: "未发布" },
              { value: 1, text: "已发布" },
            ],
          },
          columns: [
            { type: "selection", width: 50, key: "handle" },
            { title: "标题", key: "articleTitle" },
            { title: "类型", key: "name" },
            { title: "发布时间", key: "releaseTime" },
            // { title: "是否启用", key: "isEnable"},
            // { title: "状态", key: "IsDelete", align: "center", tooltip:true,ellipsis: true,minWidth: 70,slot:"state" },
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
        articleName: "",
        spotContent: "",
        address: "",
        orderBy: "",
        isRelease: 0,
        coverPhoto: "",
        audio: "",
      },
    };
  },
  computed: {
    formTitle() {
      if (this.formModel.mode === "create") {
        return "添加文章";
      }
      if (this.formModel.mode === "edit") {
        return "编辑文章";
      }
      return "";
    },
    selectedRows() {
      return this.formModel.selection;
    },
    selectedRowsId() {
      return this.formModel.selection.map((x) => x.id);
    },
  },
  methods: {
    async showUpResult(response, file, fileList) {
      this.loadingStatus = false;
      this.updisabled = false;
      if (response.code == "200") {
        this.$Message.success(response.message);
        if (this.formModel.fields.coverPhoto != null) {
          if (this.formModel.fields.coverPhoto.length > 0) {
            this.formModel.fields.coverPhoto += ",";
          }
          this.formModel.fields.coverPhoto += response.data.fname;
        } else {
          this.formModel.fields.coverPhoto = response.data.fname;
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
    },
    handleRemove(file) {
      this.uploadList = this.uploadList.filter((x) => x.name != file);
      this.formModel.fields.coverPhoto = this.uploadList
        .map((x) => x.fileName)
        .join(",");
      const fileList = this.$refs.upload.fileList;
      this.$refs.upload.fileList.splice(fileList.indexOf(file), 1);
      deletetoFile({ filePath: file }).then((res) => {
        if (res.data.code == "200") {
          this.uploadList = this.uploadList.filter((x) => x.name != file);
          this.formModel.fields.coverPhoto = this.uploadList
            .map((x) => x.fileName)
            .join(",");
        } else {
          this.uploadList = this.uploadList.filter((x) => x.name != file);
          this.formModel.fields.coverPhoto = this.uploadList
            .map((x) => x.fileName)
            .join(",");
          this.$Message.warning(res.data.message);
        }
      });
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
      if (this.formModel.dFileName != null && this.formModel.dFileName != "") {
        deletetoFile({ filename: this.formModel.dFileName }).then(res => {
          console.log(res);
        });
      }
    },
    vhandleMaxSize(file) {
      this.$Notice.warning({
        title: "文件过大",
        desc: file.name + "超过20M",
      });
    },
    // deletevideo(file){
    //   console.log(file)
    //   console.log(this.vuploadList)
    //   this.vuploadList = this.vuploadList.filter(x => x.name != 'UploadFiles/Spotpublicity/Video/'+file);
    //   this.formModel.fields.video = this.vuploadList
    //     .map(x => x.fileName)
    //     .join(",");
    // },
    // downloadvideo(file){
    //   window.location.href =  config.baseUrl.dev +'UploadFiles/Spotpublicity/Video/'+file
    // },

    async ashowUpResult(e) {
      this.aloadingStatus = false;
      this.aupdisabled = false;
      if (e.code == "200") {
        this.$Message.success(e.message);
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
      if (this.formModel.dFileName != null && this.formModel.dFileName != "") {
        deletetoFile({ filename: this.formModel.dFileName }).then(res => {
          console.log(res);
        });
      }
    },
    ahandleMaxSize(file) {
      this.$Notice.warning({
        title: "文件过大",
        desc: file.name + "超过20M",
      });
    },

    renderState(isRelease) {
      let _isRelease = "全部";
      switch (state) {
        case -1:
          _isRelease = "全部";
        case 0:
          _isRelease = "未发布";
          break;
        case 1:
          _isRelease = "已发布";
          break;
      }
      return _isRelease;
    },
    loadarticleList() {
      getArticleList(this.stores.article.query).then((res) => {
        this.stores.article.data = res.data.data;
        this.stores.article.query.totalCount = res.data.totalCount;
        //console.log(this.stores.educaplan.data);
      });
    },
    handleSearchPublicity() {
      this.stores.article.query.currentPage = 1;
      this.loadarticleList();
    },
    handleRefresh() {
      this.stores.article.query.currentPage = 1;
      this.loadarticleList();
    },
    //创建，修改
    handleSubmitPlan() {
      let valid = this.validateForm();
      if (valid) {
        if (this.formModel.mode === "create") {
          this.docreateArticle();
        }
        if (this.formModel.mode === "edit") {
          this.doEditPlan();
        }
      }
    },
    docreateArticle() {
      createArticle(this.formModel.fields).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.handleCloseFormWindow();
          this.loadarticleList();
        } else {
          this.$Message.warning(res.data.message);
        }
      });
    },
    doEditPlan() {
      editArticle(this.formModel.fields).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.handleCloseFormWindow();
          this.loadarticleList();
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
          this.loadarticleList();
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
      batchCommand({
        command: "删除",
        ids: row.id,
      }).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.loadarticleList();
          this.formModel.selection = [];
        } else {
          this.$Message.warning(res.data.message);
        }
        this.$Modal.remove();
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
      this.uploadList = [];
      this.defaultList = [];
      this.handleSwitchFormModeToEdit();
      this.handleResetFormRole();
      this.doLoadArticle(row.articleUuid);
    },
    handleShow(row) {
      this.formModel1.opened = true;
      this.handleResetFormRole();
      this.doLoadArticle(row.articleUuid);
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
    doLoadArticle(guid) {
      loadArticle({ guid: guid }).then((res) => {
        this.formModel.fields = res.data.data;
        if (res.data.data.coverPhoto != null&&res.data.data.coverPhoto != "") {
          let list = res.data.data.coverPhoto.split(",");
          for (let i = 0; i < list.length; i++) {
            this.uploadList.push({
              url: config.baseUrl.dev + "UploadFiles/Article/" + list[i],
              status: "finished",
              name: "UploadFiles/Article/" + list[i],
              fileName: list[i],
            });
          }
        }

        // if (res.data.data.video != null) {
        //   let list = res.data.data.video.split(",");
        //   for (let i = 0; i < list.length; i++) {
        //     this.vuploadList.push({
        //       url:
        //         config.baseUrl.dev + "UploadFiles/Spotpublicity/Video/" + list[i],
        //       status: "finished",
        //       name: "UploadFiles/Spotpublicity/Video/" + list[i],
        //       fileName: list[i]
        //     });
        //   }
        // }
      });
    },
    handlePageChanged(page) {
      this.stores.article.query.currentPage = page;
      this.loadarticleList();
    },
    handlePageSizeChanged(pageSize) {
      this.stores.article.query.pageSize = pageSize;
      this.loadarticleList();
    },
    getarticletypelist() {
      Articletypelist().then((res) => {
        if (res.data.code == 200) {
          this.articletypelist = res.data.data;
          this.stores.article.sources.articletypelist = this.stores.article.sources.articletypelist.concat(
            res.data.data
          );
        }
      });
    },
  },
  mounted() {
    this.loadarticleList();
    this.getarticletypelist();
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
