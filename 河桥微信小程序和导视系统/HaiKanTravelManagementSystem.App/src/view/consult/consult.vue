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
          <FormItem label="电话名称" prop="phoneName">
            <Input
              v-model.trim="formModel.fields.phoneName"
              placeholder="请输入电话名称"
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
      </Form>

      <div style="margin-top: 100px" v-show="wzy">
        <Button icon="md-checkpublicitytype-circle" type="primary" @click="handleSubmitPlan">保 存</Button>
        <Button style="margin-left: 8px" icon="md-close" @click="formModel.opened = false">取 消</Button>
      </div>
    </Drawer>
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
} from "@/api/consult/consult";
export default {
  name: "consult",
  components: {
    Tables,
    DzTable,
  },
  data() {
        let validate = (rule, value, callback) => {
      if (value !== "" && value !== null) {
        let reg = /^(0(?!\.0{1,2}$)(\.[0-9]{1,2})?|[1-9][0-9]{0,2}(\.[0-9]{1,2})?)$/;
        if (!reg.test(value)) {
          callback(new Error("价格格式错误！最多可以两位小数,且不超过999.99"));
        }
        callback();
      } else {
        callback(new Error("价格不能为空"));
      }
      callback();
    };
    return {
      wzy: true,
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
          phoneName: "",
          phone: "",
          releaseState: 0,
          consultUuid:""
        },
        rules: {
          phoneName: [
            {
              type: "string",
              required: true,
              message: "请输入电话名称",
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
          phone: [
            {
              type: "string",
              required: true,
              trigger: "blur"
            }
          ]
        }
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
            { type: "selection", width: 50, key: "consultUuid" },
            { title: "电话名称", key: "phoneName" },
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
      return this.formModel.selection.map((x) => x.consultUuid);
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
        // let reg = /^[1][3,4,5,7,8][0-9]{9}$/;
        // if (!reg.test(this.formModel.fields.phone)) {
        //   this.$Message.warning("手机号不合法!");
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
      this.wzy=true;
      this.formModel.mode = "create";
      this.handleResetFormDispatch(); //清空表单
      this.formModel.opened = true;
    },
    //编辑
    handleEdit(row) {
      this.wzy=true;
      this.formModel.mode = "edit";
      this.formModel.opened = true;
      this.handleResetFormDispatch(); //清空表单
      this.doLoadData(row.consultUuid);
    },
    //详情显示
    handleDetail(e) {
      this.wzy = false;
      this.formModel.mode = "show";
      this.formModel.opened = true;
      this.handleResetFormDispatch(); //清空表单
      this.doLoadData(e.consultUuid);
    },
    //查询当前行信息
    doLoadData(guid) {
      GetShow(guid).then((res) => {
        this.formModel.fields = res.data.data;
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
      this.doDelete(row.consultUuid);
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
  },
  mounted() {
    this.loadDispatchList();
  },
};
</script>
<style scoped>
</style>
