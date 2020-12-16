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
                      v-model="stores.scenicspot.query.kw"
                      placeholder="输入名称搜索..."
                      @on-search="handleSearchScenicspot()"
                    >
                      <Select
                        slot="prepend"
                        v-model="stores.scenicspot.query.isDeleted"
                        @on-change="handleSearchScenicspot"
                        placeholder="删除状态"
                        style="width: 60px"
                      >
                        <Option
                          v-for="item in stores.scenicspot.sources
                            .isDeletedSources"
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
                  title="新增设备"
                  >新增设备</Button
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
          :data="stores.scenicspot.data"
          :columns="stores.scenicspot.columns"
          @on-selection-change="handleSelectionChange"
          @on-refresh="handleRefresh"
          :row-class-name="rowClsRender"
          @on-page-change="handlePageChanged"
          @on-page-size-change="handlePageSizeChanged"
        >
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
            <FormItem label="设备名称" prop="pointerName">
              <Input
                v-model="formModel.fields.pointerName"
                placeholder="请输入设备名称"
                style="width: 400px"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="设备编号" prop="pointerNum">
              <Input
                v-model="formModel.fields.pointerNum"
                placeholder="请输入设备编号"
                style="width: 400px"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="设备地址" prop="address">
              <Input
                v-model="formModel.fields.address"
                placeholder="请输入设备地址"
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
                placeholder="请输入设备地址"
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
                placeholder="请输入设备地址"
                style="width: 400px"
              />
            </FormItem>
          </Col>
        </Row>

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
            <FormItem label="设备名称" prop="pointerName">
              <Input
                v-model="formModel.fields.pointerName"
                placeholder="请输入设备名称"
                style="width: 400px"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="设备编号" prop="pointerNum">
              <Input
                v-model="formModel.fields.pointerNum"
                placeholder="请输入设备编号"
                style="width: 400px"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="设备地址" prop="address">
              <Input
                v-model="formModel.fields.address"
                placeholder="请输入设备地址"
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
                placeholder="请输入设备地址"
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
                placeholder="请输入设备地址"
                style="width: 400px"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row>

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
  getScenicspotList,
  createScenicspot,
  loadScenicspot,
  editScenicspot,
  deleteScenicspot,
  batchCommand,
  deletetoFile,
} from "@/api/guide/PointerInfo";
import { getToken } from "@/libs/util";
import config from "@/config";
export default {
  name: "PointerInfo",
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
        title: "创建设备",
        mode: "create",
        selection: [],
        fields: {
          pointerName: "",
          lon: "",
          address: "",
          lat: "",
          pointerNum: "",
        },
        rules: {

        },
      },
      stores: {
        scenicspot: {
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
            { title: "设备名称", key: "pointerName" },
            { title: "地址", key: "address" },
            { title: "设备编号", key: "pointerNum" },
            { title: "经度", key: "lon" },
            { title: "纬度", key: "lat" },
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
          pointerName: "",
          lon: "",
          address: "",
          lat: "",
          pointerNum: "",
      },
    };
  },
  computed: {
    formTitle() {
      console.log(46464);
      console.log(this.formModel.mode);
      if (this.formModel.mode == "create") {
        return "新增设备";
      }
      if (this.formModel.mode == "edit") {
        return "编辑设备";
      }
      return "";
    },
    selectedRows() {
      return this.formModel.selection;
    },
    selectedRowsId() {
      return this.formModel.selection.map((x) => x.pointerUuid);
    },
  },
  methods: {

    loadScenicspotList() {
      getScenicspotList(this.stores.scenicspot.query).then((res) => {
        this.stores.scenicspot.data = res.data.data;
        this.stores.scenicspot.query.totalCount = res.data.totalCount;
        //console.log(this.stores.educaplan.data);
      });
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
      this.doDelete(row.pointerUuid);
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
      console.log(this.formModel.mode);
      this.doLoadScenicspot(row.pointerUuid);
    },
    handleShow(row) {
      this.formModel1.opened = true;
      this.handleResetFormRole();
      this.doLoadScenicspot(row.pointerUuid);
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
    doLoadScenicspot(guid) {
      loadScenicspot({ guid: guid }).then((res) => {
        this.formModel.fields = res.data.data;
        if (res.data.data.picture != null) {
          let list = res.data.data.picture.split(",");
          for (let i = 0; i < list.length; i++) {
            this.uploadList.push({
              url: config.baseUrl.dev + "UploadFiles/Scene/Picture/" + list[i],
              status: "finished",
              name: "UploadFiles/Scene/Picture/" + list[i],
              fileName: list[i],
            });
          }
        }

        if (res.data.data.video != null) {
          let list = res.data.data.video.split(",");
          for (let i = 0; i < list.length; i++) {
            this.vuploadList.push({
              url: config.baseUrl.dev + "UploadFiles/Scene/Video/" + list[i],
              status: "finished",
              name: "UploadFiles/Scene/Video/" + list[i],
              fileName: list[i],
            });
          }
        }

        if (res.data.data.audio != null) {
          let list = res.data.data.audio.split(",");
          for (let i = 0; i < list.length; i++) {
            this.auploadList.push({
              url: config.baseUrl.dev + "UploadFiles/Scene/Audio/" + list[i],
              status: "finished",
              name: "UploadFiles/Scene/Audio/" + list[i],
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
