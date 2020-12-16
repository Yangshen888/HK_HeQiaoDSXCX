<template>
  <div>
    <Card>
      <dz-table
        :totalCount="stores.videomark.query.totalCount"
        :pageSize="stores.videomark.query.pageSize"
        :currentPage="stores.videomark.query.currentPage"
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
                      v-model="stores.videomark.query.kw"
                      placeholder="输入名称搜索..."
                      @on-search="handleSearchVideoMark()"
                    >
                      <Select
                        slot="prepend"
                        v-model="stores.videomark.query.isDeleted"
                        @on-change="handleSearchVideoMark"
                        placeholder="删除状态"
                        style="width:60px;"
                      >
                        <Option
                          v-for="item in stores.videomark.sources.isDeletedSources"
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
                  title="新增语音"
                >新增语音</Button>
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
          :data="stores.videomark.data"
          :columns="stores.videomark.columns"
          @on-selection-change="handleSelectionChange"
          @on-refresh="handleRefresh"
          :row-class-name="rowClsRender"
          @on-page-change="handlePageChanged"
          @on-page-size-change="handlePageSizeChanged"
        >
          <template slot-scope="{row,index}" slot="isEnable">
            <Tag :color="renderIsEnable(row.isEnable).color">{{renderIsEnable(row.isEnable).text}}</Tag>
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
            <FormItem label="语音名称" prop="videoName">
              <Input
                v-model="formModel.fields.videoName"
                placeholder="请输入语音名称"
                style="width: 400px"
                :maxlength="10"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="经纬度" prop="position">
              <Input
                v-model="formModel.fields.position"
                placeholder="请输入经纬度"
                style="width: 400px"
                :maxlength="30"
              />
            </FormItem>
          </Col>
        </Row>

        <fieldset>
          <legend class="legend">音频文件</legend>
          <Row style="padding: 15px">
            <Upload
              ref="aupload"
              multiple
              :action="aactionurl"
              :headers="postheaders"
              :show-upload-list="true"
              :data="{fileSavePath:'Videomark'}"
              :on-success="ashowUpResult"
              :on-progress="atoUpResult"
              :max-size="20480"
              :on-exceeded-size="ahandleMaxSize"
              style="float:left"
              :disabled="aupdisabled"
              :on-remove="adeleteFile">
              <Button type="primary" icon="ios-cloud-upload-outline" :loading="aloadingStatus">上传视频</Button>
            </Upload>
          </Row>
          <Row v-if="formModel.fields.videoPath!=null&&formModel.fields.videoPath.length>0">
            <Card>
              <p slot="title">音频文件</p>
              <p >
                {{formModel.fields.videoPath}}
                <Button @click="deleteaudio(formModel.fields.videoPath)">删除</Button>
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
            <FormItem label="语音名称" >
              <Input
                v-model="formModel.fields.videoName"
                placeholder="请输入语音名称"
                style="width: 400px"
                :maxlength="10"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="经纬度" >
              <Input
                v-model="formModel.fields.position"
                placeholder="请输入经纬度"
                style="width: 400px"
                :maxlength="30"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row>

        <fieldset>
          <legend class="legend">音频文件</legend>
          <Row style="padding: 15px">
<!--            <Upload-->
<!--              ref="aupload"-->
<!--              multiple-->
<!--              :action="aactionurl"-->
<!--              :headers="postheaders"-->
<!--              :show-upload-list="true"-->
<!--              :data="{fileSavePath:'Videomark'}"-->
<!--              :on-success="ashowUpResult"-->
<!--              :on-progress="atoUpResult"-->
<!--              :max-size="20480"-->
<!--              :on-exceeded-size="ahandleMaxSize"-->
<!--              style="float:left"-->
<!--              :disabled="aupdisabled"-->
<!--              :on-remove="adeleteFile">-->
<!--              <Button type="primary" icon="ios-cloud-upload-outline" :loading="aloadingStatus">上传视频</Button>-->
<!--            </Upload>-->
          </Row>
          <Row v-if="formModel.fields.videoPath!=null&&formModel.fields.videoPath.length>0">
            <Card>
              <p slot="title">音频文件</p>
              <p >
                {{formModel.fields.videoPath}}
                <Button @click="downloadaudio(formModel.fields.videoPath)">下载</Button>
              </p>
            </Card>
          </Row>
        </fieldset>

      </Form>

      <div style="margin-top: 100px">
        <Button icon="md-checkmark-circle" type="primary" @click="handleSubmitPlan">保 存</Button>
        <Button style="margin-left: 8px" icon="md-close" @click="formModel.opened = false">取 消</Button>
      </div>
    </Drawer>
  </div>
</template>
<script>
  import DzTable from "_c/tables/dz-table.vue";
  import Tables from "_c/tables";
  import {
    getVideoMarkList,
    createVideoMark,
    loadVideoMark,
    editVideoMark,
    deleteVideoMark,
    batchCommand
  } from "@/api/intelligentguide/videomark";
  import { getToken } from "@/libs/util";
  import config from "@/config";
  export default {
    name: "videomark",
    components: {
      Tables,
      DzTable
    },
    data() {
      return {
        postheaders:"",
        showdetails: false,
        details: "",
        commands: {
          delete: { name: "delete", title: "删除" },
          recover: { name: "recover", title: "恢复" },
          forbidden: { name: "forbidden", title: "禁用" },
          normal: { name: "normal", title: "启用" }
        },

        aloadingStatus:false,
        aactionurl:config.baseUrl.dev + "api/v1/common/common/UpLoadFile",
        aupdisabled:false,
        auploadList:[],
        formModel1:{
          opened: false,
        },
        formModel: {
          opened: false,
          title: "创建语音",
          mode: "create",
          selection: [],
          fields: {
            videoName: "",
            position:"",
            videoPath:""
          },
          rules: {
            videoName: [{type: "string",required: true,message: "请输入语音名称",trigger:'blur'}],
            position: [{type: "string",required: true,message: "请输入经纬度",trigger:'blur'}],
          }
        },
        stores: {
          videomark: {
            query: {
              totalCount: 0,
              pageSize: 20,
              currentPage: 1,
              kw: "",
              isDeleted: 0,
              status: -1,
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
            },
            columns: [
              { type: "selection", width: 50, key: "handle" },
              { title: "语音名称", key: "videoName" },
              { title: "经纬度", key: "position" },
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
          videoName: "",
          position:"",
          videoPath:""
        }
      };
    },
    computed: {
      formTitle() {
        if (this.formModel.mode === "create") {
          return "新增语音";
        }
        if (this.formModel.mode === "edit") {
          return "编辑语音";
        }
        return "";
      },
      selectedRows() {
        return this.formModel.selection;
      },
      selectedRowsId() {
        return this.formModel.selection.map(x => x.videomarkUuid);
      }
    },
    methods: {
      async ashowUpResult(e) {
        this.aloadingStatus = false;
        this.aupdisabled = false;
        if (e.code == "200") {
          this.$Message.success(e.message);
          this.formModel.fields.videoPath = e.data.fname;
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

      },
      ahandleMaxSize(file){
        this.$Notice.warning({
          title: '文件过大',
          desc: file.name + '超过20M'
        });
      },
      deleteaudio(file){
        this.formModel.fields.videoPath="";
      },
      downloadaudio(file){
        window.location.href =  config.baseUrl.dev +'UploadFiles/Videomark/'+file
      },


      loadVideoMarkList() {
        getVideoMarkList(this.stores.videomark.query).then(res => {
          this.stores.videomark.data = res.data.data;
          this.stores.videomark.query.totalCount = res.data.totalCount;
          //console.log(this.stores.educaplan.data);
        });
      },
      handleSearchVideoMark() {
        this.stores.videomark.query.currentPage = 1;
        this.loadVideoMarkList();
      },
      handleRefresh() {
        this.stores.videomark.query.currentPage = 1;
        this.loadVideoMarkList();
      },
      //创建，修改
      handleSubmitPlan() {
        let valid = this.validateForm();
        if (valid) {
          if (this.formModel.mode === "create") {
            this.docreateVideoMark();
          }
          if (this.formModel.mode === "edit") {
            this.doEditPlan();
          }
        }
      },
      docreateVideoMark() {
        createVideoMark(this.formModel.fields).then(res => {
          if (res.data.code === 200) {
            this.$Message.success(res.data.message);
            this.handleCloseFormWindow();
            this.loadVideoMarkList();
          } else {
            this.$Message.warning(res.data.message);
          }
        });
      },
      doEditPlan() {
        editVideoMark(this.formModel.fields).then(res => {
          if (res.data.code === 200) {
            this.$Message.success(res.data.message);
            this.handleCloseFormWindow();
            this.loadVideoMarkList();
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
            this.loadVideoMarkList();
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
        this.doDelete(row.videomarkUuid);
      },
      doDelete(ids) {
        if (!ids) {
          this.$Message.warning("请选择至少一条数据");
          return;
        }
        deleteVideoMark(ids).then(res => {
          if (res.data.code === 200) {
            this.$Message.success(res.data.message);
            this.loadVideoMarkList();
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
        this.doLoadVideoMark(row.videomarkUuid);
      },
      handleShow(row)
      {
        this.formModel1.opened=true;
        this.handleResetFormRole();
        this.doLoadVideoMark(row.videomarkUuid);
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
        this.formModel.fields = this.initdatacopy;
        //this.$refs["formPlan"].resetFields();
      },
      doLoadVideoMark(guid) {
        loadVideoMark({ guid: guid }).then(res => {
          this.formModel.fields = res.data.data;
        });
      },
      handlePageChanged(page) {
        this.stores.videomark.query.currentPage = page;
        this.loadVideoMarkList();
      },
      handlePageSizeChanged(pageSize) {
        this.stores.videomark.query.pageSize = pageSize;
        this.loadVideoMarkList();
      }
    },
    mounted() {
      this.loadVideoMarkList();
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
</style>
