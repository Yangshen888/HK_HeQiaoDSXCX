<template>
  <div>
    <Card>
      <dz-table
        :totalCount="stores.promotionalvideo.query.totalCount"
        :pageSize="stores.promotionalvideo.query.pageSize"
        :currentPage="stores.promotionalvideo.query.currentPage"
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
                      v-model="stores.promotionalvideo.query.kw"
                      placeholder="输入名称搜索..."
                      @on-search="handleSearchPromotionalvideo()"
                    >
                      <Select
                        slot="prepend"
                        v-model="stores.promotionalvideo.query.isDeleted"
                        @on-change="handleSearchPromotionalvideo"
                        placeholder="删除状态"
                        style="width:60px;"
                      >
                        <Option
                          v-for="item in stores.promotionalvideo.sources.isDeletedSources"
                          :value="item.value"
                          :key="item.value"
                        >{{item.text}}</Option>
                      </Select>
                      <Select
                        slot="prepend"
                        v-model="stores.promotionalvideo.query.state"
                        @on-change="handleSearchPromotionalvideo"
                        placeholder="发布状态"
                        style="width:60px;"
                      >
                        <Option
                          v-for="item in stores.promotionalvideo.sources.stateSources"
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
                  title="新增宣传"
                >新增宣传</Button>
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
          :data="stores.promotionalvideo.data"
          :columns="stores.promotionalvideo.columns"
          @on-selection-change="handleSelectionChange"
          @on-refresh="handleRefresh"
          :row-class-name="rowClsRender"
          @on-page-change="handlePageChanged"
          @on-page-size-change="handlePageSizeChanged"
        >
          <template slot-scope="{row,index}" slot="state">
            <span>{{renderState(row.releaseState)}}</span>
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
            <FormItem label="标题" prop="title">
              <Input
                v-model.trim="formModel.fields.title"
                placeholder="请输入标题"
                style="width: 400px"
                :maxlength="20"
              />
            </FormItem>
          </Col>
        </Row>

        <fieldset>
          <legend class="legend">封面(推荐大小370*330)</legend>
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
              :data="{fileSavePath:'Scene/Picture'}"
              :on-format-error="handleFormatError"
              :on-exceeded-size="handleMaxSize"
              :before-upload="handleBeforeUpload"
              :headers="postheaders"
              :disabled="updisabled"
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

        <Row :gutter="16" style="margin-top: 20px">
          <Col span="12">
            <FormItem label="发布时间" prop="releaseTime">
              <DatePicker
                type="date"
                format="yyyy-MM-dd"
                @on-change="formModel.fields.releaseTime=$event"
                :value="formModel.fields.releaseTime"
                placeholder="请输入发布时间"
                style="width: 400px"
              ></DatePicker>
            </FormItem>
          </Col>
        </Row>




        <Row :gutter="16">
          <Col span="12">
            <FormItem label="状态"  label-position="left">
              <i-switch
                size="large"
                v-model="formModel.fields.releaseState"
                :true-value="1"
                :false-value="0"
              >
                <span slot="open">发布</span>
                <span slot="close">保存</span>
              </i-switch>
            </FormItem>
          </Col>
          <Col span="12">
            <FormItem label="是否推荐"  label-position="left">
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
          <legend class="legend">景区视频(不超过30M)</legend>
          <Row style="padding: 15px">
            <Upload
              ref="vupload"
              multiple
              :action="vactionurl"
              :headers="postheaders"
              :show-upload-list="true"
              :data="{fileSavePath:'Scene/Video'}"
              :on-success="vshowUpResult"
              :on-progress="vtoUpResult"
              :max-size="20480"
              :on-exceeded-size="vhandleMaxSize"
              style="float:left"
              :disabled="vupdisabled"
              :on-remove="vdeleteFile">
              <Button type="primary" icon="ios-cloud-upload-outline" :loading="vloadingStatus">上传视频</Button>
            </Upload>
          </Row>
          <Row v-if="formModel.fields.video!=null&&formModel.fields.video.length>0">
            <Card>
              <p slot="title">视频文件</p>
              <p v-for="item in formModel.fields.video.split(',')">
                {{item}}
                <Button @click="deletevideo(item)">删除</Button>
              </p>
              <!-- <Button @click="download">下载</Button> -->
            </Card>
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
            <FormItem label="标题" >
              <Input
                v-model="formModel.fields.title"
                placeholder="请输入标题"
                style="width: 400px"
                :maxlength="20"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="发布时间" >
              <Input
                v-model="formModel.fields.releaseTime"
                placeholder="请输入发布时间"
                style="width: 400px"
                :maxlength="200"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row>

        <Row :gutter="16">
          <Col span="12">
            <FormItem label="状态"  label-position="left">
              <i-switch
                size="large"
                v-model="formModel.fields.releaseState"
                :true-value="1"
                :false-value="0"
                :disabled="true"
              >
                <span slot="open">发布</span>
                <span slot="close">保存</span>
              </i-switch>
            </FormItem>
          </Col>
           <Col span="12">
            <FormItem label="是否推荐"  label-position="left">
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
          <legend class="legend">景区图片</legend>
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
            <!--            <Divider dashed />-->
            <!--            <Upload-->
            <!--              ref="upload"-->
            <!--              :show-upload-list="false"-->
            <!--              :default-file-list="defaultList"-->
            <!--              :on-success="showUpResult"-->
            <!--              :on-progress="toUpResult"-->
            <!--              :format="['jpg','jpeg','png']"-->
            <!--              :max-size="5120"-->
            <!--              :data="{fileSavePath:'PromotionalVideo/Picture'}"-->
            <!--              :on-format-error="handleFormatError"-->
            <!--              :on-exceeded-size="handleMaxSize"-->
            <!--              :before-upload="handleBeforeUpload"-->
            <!--              :headers="postheaders"-->
            <!--              type="drag"-->
            <!--              :action="actionurl"-->
            <!--              style="display: inline-block;width:58px;"-->
            <!--            >-->
            <!--              <div style="width: 58px;height:58px;line-height: 58px;">-->
            <!--                <Icon type="ios-camera" size="20"></Icon>-->
            <!--              </div>-->
            <!--            </Upload>-->

          </Row>
        </fieldset>

        <fieldset>
          <legend class="legend">景区视频</legend>
          <!--          <Row style="padding: 15px">-->
          <!--            <Upload-->
          <!--              ref="vupload"-->
          <!--              multiple-->
          <!--              :action="vactionurl"-->
          <!--              :headers="postheaders"-->
          <!--              :show-upload-list="true"-->
          <!--              :data="{fileSavePath:'PromotionalVideo/Video'}"-->
          <!--              :on-success="vshowUpResult"-->
          <!--              :on-progress="vtoUpResult"-->
          <!--              :max-size="20480"-->
          <!--              :on-exceeded-size="vhandleMaxSize"-->
          <!--              style="float:left"-->
          <!--              :disabled="vupdisabled"-->
          <!--              :on-remove="vdeleteFile">-->
          <!--              <Button type="primary" icon="ios-cloud-upload-outline" :loading="vloadingStatus">上传视频</Button>-->
          <!--            </Upload>-->
          <!--          </Row>-->
          <Row v-if="formModel.fields.video!=null&&formModel.fields.video.length>0" style="padding: 15px">
            <Card>
              <p slot="title">视频文件</p>
              <p v-for="item in formModel.fields.video.split(',')">
                {{item}}
                <!--                <Button @click="deletevideo(item)">删除</Button>-->
                <Button @click="downloadvideo(item)">下载</Button>
              </p>

            </Card>
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
    getPromotionalvideoList,
    createPromotionalvideo,
    loadPromotionalvideo,
    editPromotionalvideo,
    deletePromotionalvideo,
    batchCommand
  } from "@/api/spotpublicity/promotionalvideo";
  import { getToken } from "@/libs/util";
  import config from "@/config";
  export default {
    name: "promotionalvideo",
    components: {
      Tables,
      DzTable
    },
    data() {
      let checkNum = (rule, value, callback) => {
        if (value === "") {
          callback(new Error("请输入"));
        } else if (value <= 0 ) {
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
          normal: { name: "normal", title: "启用" }
        },

        uploadList: [],
        defaultList: [],
        actionurl: config.baseUrl.dev + "api/v1/common/common/UpLoadPicture",
        postheaders: "",
        imgName: "",
        loadingStatus: false,
        updisabled: false,
        visible: false,

        vloadingStatus:false,
        vactionurl:config.baseUrl.dev + "api/v1/common/common/UpLoadFile",
        vupdisabled:false,
        vuploadList:[],


        formModel1:{
          opened:false,
        },
        formModel: {
          opened: false,
          title: "创建宣传",
          mode: "create",
          selection: [],
          fields: {
            title: "",
            cover:"",
            releaseTime:"",
            releaseState:0,
            video:"",
            isRecommend:false,

          },
          rules: {
            title: [{type: "string",required: true,message: "请输入标题",trigger:'blur'}],
            releaseTime: [{type: "string",required: true,message: "请输入发布时间",trigger:'blur'}],

          }
        },
        stores: {
          promotionalvideo: {
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
                  field: "ID"
                }
              ]
            },
            sources: {

              isDeletedSources: [
                { value: -1, text: "全部" },
                { value: 0, text: "正常" },
                { value: 1, text: "已删" }
              ],
              stateSources: [
                { value: -1, text: "全部" },
                { value: 0, text: "保存中" },
                { value: 1, text: "已发布" }
              ],
            },
            columns: [
              { type: "selection", width: 50, key: "handle" },
              { title: "标题", key: "title" },
              { title: "发布时间", key: "releaseTime" },
              // { title: "是否启用", key: "isEnable"},
              { title: "状态", key: "releaseState", align: "center", tooltip:true,ellipsis: true,minWidth: 70,slot:"state" },
              {
                title: "操作",
                fixed: "right",
                align: "center",
                width: 150,
                className: "table-command-column",
                slot: "action"
              }
            ],
            data: []
          }
        },
        styles: {
          height: "calc(100% - 55px)",
          overflow: "auto",
          paddingBottom: "53px",
          position: "static"
        },
        initdatacopy: {
          title: "",
          cover:"",
          releaseTime:"",
          releaseState:0,
          video:""
        }
      };
    },
    computed: {
      formTitle() {
        if (this.formModel.mode === "create") {
          return "新增宣传";
        }
        if (this.formModel.mode === "edit") {
          return "编辑宣传";
        }
        return "";
      },
      selectedRows() {
        return this.formModel.selection;
      },
      selectedRowsId() {
        return this.formModel.selection.map(x => x.promotionalVideoUuid);
      }
    },
    methods: {
      async showUpResult(response, file, fileList) {
        this.loadingStatus = false;
        this.updisabled = true;
        if (response.code == "200") {
          this.$Message.success(response.message);
          console.log(this.formModel.fields.cover);
          if (this.formModel.fields.cover != null) {
            if (this.formModel.fields.cover.length > 0) {
              this.formModel.fields.cover += ",";
            }
            this.formModel.fields.cover += response.data.fname;
          } else {
            this.formModel.fields.cover = response.data.fname;
          }
          await this.uploadList.push({
            url: config.baseUrl.dev + response.data.strpath.replace("\\", "/"),
            status: "finished",
            name: response.data.strpath,
            fileName: response.data.fname
          });

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
          desc: "文件: " + file.name + " 不是png,jpg"
        });
      },
      handleMaxSize(file) {
        this.$Notice.warning({
          title: "Exceeding file size limit",
          desc: "文件 " + file.name + " 太大,超过5M."
        });
      },
      handleBeforeUpload() {
        // const check = this.uploadList.length < 5;
        // if (!check) {
        //   this.$Notice.warning({
        //     title: "Up to five covers can be uploaded."
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
        this.uploadList = this.uploadList.filter(x => x.name != file);
        this.formModel.fields.cover = this.uploadList
          .map(x => x.fileName)
          .join(",");
      },



      async vshowUpResult(e) {
        this.vloadingStatus = false;
        this.vupdisabled = false;
        if (e.code == "200") {
          this.$Message.success(e.message);

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
            fileName: e.data.fname
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

      },
      vhandleMaxSize(file){
        this.$Notice.warning({
          title: '文件过大',
          desc: file.name + '超过20M'
        });
      },
      deletevideo(file){
        this.vuploadList = this.vuploadList.filter(x => x.name != 'UploadFiles/Scene/Video/'+file);
        this.formModel.fields.video = this.vuploadList
          .map(x => x.fileName)
          .join(",");
      },
      downloadvideo(file){
        window.location.href =  config.baseUrl.dev +'UploadFiles/Scene/Video/'+file
      },


      renderState(state){
        let _status = "未发布";
        switch(state){
          case 0:
            _status = "未发布";
            break;
          case 1:
            _status = "已发布";
            break;
        }
        return _status;
      },
      loadPromotionalvideoList() {
        getPromotionalvideoList(this.stores.promotionalvideo.query).then(res => {
          this.stores.promotionalvideo.data = res.data.data;
          this.stores.promotionalvideo.query.totalCount = res.data.totalCount;
          //console.log(this.stores.educaplan.data);
        });
      },
      handleSearchPromotionalvideo() {
        this.stores.promotionalvideo.query.currentPage = 1;
        this.loadPromotionalvideoList();
      },
      handleRefresh() {
        this.stores.promotionalvideo.query.currentPage = 1;
        this.loadPromotionalvideoList();
      },
      //创建，修改
      handleSubmitPlan() {
        let valid = this.validateForm();
        if (valid) {
          if (this.formModel.mode === "create") {
            this.docreatePromotionalvideo();
          }
          if (this.formModel.mode === "edit") {
            this.doEditPlan();
          }
        }
      },
      docreatePromotionalvideo() {
        createPromotionalvideo(this.formModel.fields).then(res => {
          if (res.data.code === 200) {
            this.$Message.success(res.data.message);
            this.handleCloseFormWindow();
            this.loadPromotionalvideoList();
          } else {
            this.$Message.warning(res.data.message);
          }
        });
      },
      doEditPlan() {
        editPromotionalvideo(this.formModel.fields).then(res => {
          if (res.data.code === 200) {
            this.$Message.success(res.data.message);
            this.handleCloseFormWindow();
            this.loadPromotionalvideoList();
          } else {
            this.$Message.warning(res.data.message);
          }
        });
      },
      validateForm() {
        let _valid = false;
        this.$refs["formPlan"].validate(valid => {
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
          }
        });
        //addsystemlog("delete","删除年度市级招生方案列表");
      },
      doBatchCommand(command) {
        batchCommand({
          command: command,
          ids: this.selectedRowsId.join(",")
        }).then(res => {
          if (res.data.code === 200) {
            this.$Message.success(res.data.message);
            this.loadPromotionalvideoList();
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
        this.doDelete(row.promotionalVideoUuid);
      },
      doDelete(ids) {
        if (!ids) {
          this.$Message.warning("请选择至少一条数据");
          return;
        }
        deletePromotionalvideo(ids).then(res => {
          if (res.data.code === 200) {
            this.$Message.success(res.data.message);
            this.loadPromotionalvideoList();
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
        if (row.cover=="") {
          this.updisabled=false;
        } else {
          this.updisabled=true;
        }
        this.handleSwitchFormModeToEdit();
        this.handleResetFormRole();
        this.doLoadPromotionalvideo(row.promotionalVideoUuid);
      },
      handleShow(row)
      {
        this.formModel1.opened=true;
        this.handleResetFormRole();
        this.doLoadPromotionalvideo(row.promotionalVideoUuid);
      },

      handleShowCreateWindow() {
        this.updisabled=false
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
        this.uploadList=[];
        this.vuploadList=[];
      },
      doLoadPromotionalvideo(guid) {
        loadPromotionalvideo({ guid: guid }).then(res => {
          this.formModel.fields = res.data.data;
          if (res.data.data.cover != null) {
            let list = res.data.data.cover.split(",");
            for (let i = 0; i < list.length; i++) {
              this.uploadList.push({
                url:
                  config.baseUrl.dev + "UploadFiles/Scene/Picture/" + list[i],
                status: "finished",
                name: "UploadFiles/Scene/Picture/" + list[i],
                fileName: list[i]
              });
            }
          }

          if (res.data.data.video != null) {
            let list = res.data.data.video.split(",");
            for (let i = 0; i < list.length; i++) {
              this.vuploadList.push({
                url:
                  config.baseUrl.dev + "UploadFiles/Scene/Video/" + list[i],
                status: "finished",
                name: "UploadFiles/Scene/Video/" + list[i],
                fileName: list[i]
              });
            }
          }

          if (res.data.data.audio != null) {
            let list = res.data.data.audio.split(",");
            for (let i = 0; i < list.length; i++) {
              this.auploadList.push({
                url:
                  config.baseUrl.dev + "UploadFiles/Scene/Audio/" + list[i],
                status: "finished",
                name: "UploadFiles/Scene/Audio/" + list[i],
                fileName: list[i]
              });
            }
          }
        });
      },
      handlePageChanged(page) {
        this.stores.promotionalvideo.query.currentPage = page;
        this.loadPromotionalvideoList();
      },
      handlePageSizeChanged(pageSize) {
        this.stores.promotionalvideo.query.pageSize = pageSize;
        this.loadPromotionalvideoList();
      }
    },
    mounted() {
      this.loadPromotionalvideoList();
    },
    created() {
      this.postheaders = {
        Authorization: "Bearer " + getToken()
        //Accept: "application/json, text/plain, */*"
      };
    }
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
