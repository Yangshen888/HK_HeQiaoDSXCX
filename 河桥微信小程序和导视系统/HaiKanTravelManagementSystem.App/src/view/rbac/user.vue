<template>
  <div>
    <Card>
      <dz-table
        :totalCount="stores.user.query.totalCount"
        :pageSize="stores.user.query.pageSize"
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
                      v-model="stores.user.query.kw"
                      placeholder="输入关键字搜索..."
                      @on-search="handleSearchUser()"
                    >
                      <Select
                        slot="prepend"
                        v-model="stores.user.query.isDeleted"
                        @on-change="handleSearchUser"
                        placeholder="删除状态"
                        style="width:60px;"
                      >
                        <Option
                          v-for="item in stores.user.sources.isDeletedSources"
                          :value="item.value"
                          :key="item.value"
                        >{{item.text}}</Option>
                      </Select>
<!--                      <Select-->
<!--                        slot="prepend"-->
<!--                        v-model="stores.user.query.status"-->
<!--                        @on-change="handleSearchUser"-->
<!--                        placeholder="用户状态"-->
<!--                        style="width:60px;"-->
<!--                      >-->
<!--                        <Option-->
<!--                          v-for="item in stores.user.sources.statusSources"-->
<!--                          :value="item.value"-->
<!--                          :key="item.value"-->
<!--                        >{{item.text}}</Option>-->
<!--                      </Select>-->
                    </Input>
                  </FormItem>
                </Form>
              </Col>
              <Col span="8" class="dnc-toolbar-btns">
                <ButtonGroup class="mr3">
                  <Button
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
<!--                  <Button-->
<!--                    class="txt-danger"-->
<!--                    icon="md-hand"-->
<!--                    title="禁用"-->
<!--                    @click="handleBatchCommand('forbidden')"-->
<!--                  ></Button>-->
<!--                  <Button-->
<!--                    class="txt-success"-->
<!--                    icon="md-checkmark"-->
<!--                    title="启用"-->
<!--                    @click="handleBatchCommand('normal')"-->
<!--                  ></Button>-->
                  <Button icon="md-refresh" title="刷新" @click="handleRefresh"></Button>
                </ButtonGroup>
                <Button
                  v-can="'create'"
                  icon="md-create"
                  type="primary"
                  @click="handleShowCreateWindow"
                  title="新增用户"
                >新增用户</Button>
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
            :data="stores.user.data"
            :columns="stores.user.columns"
            @on-select="handleSelect"
            @on-selection-change="handleSelectionChange"
            @on-refresh="handleRefresh"
            :row-class-name="rowClsRender"
            @on-page-change="handlePageChanged"
            @on-page-size-change="handlePageSizeChanged"
            @on-sort-change="handleSortChange"
          >
          <template slot-scope="{row,index}" slot="userType">
            <span>{{renderUserType(row.userType)}}</span>
          </template>
          <template slot-scope="{row,index}" slot="status">
            <Tag :color="renderStatus(row.status).color">{{renderStatus(row.status).text}}</Tag>
          </template>
          <template slot-scope="{ row, index }" slot="action">
            <Poptip
              confirm
              :transfer="true"
              title="确定要删除吗?"
              @on-ok="handleDelete(row)"
              >
              <Tooltip placement="top" content="删除" :delay="1000" :transfer="true">
                <Button type="error" size="small" shape="circle" icon="md-trash"></Button>
              </Tooltip>
            </Poptip>
            <Tooltip placement="top" content="编辑" :delay="1000" :transfer="true">
              <Button v-can="'edit'" type="primary" size="small" shape="circle" icon="md-create" @click="handleEdit(row)"></Button>
            </Tooltip>
<!--            <Tooltip placement="top" content="分配角色" :delay="1000" :transfer="true">-->
<!--              <Button type="success" size="small" shape="circle" icon="md-contacts" @click="handleAssignRole(row)"></Button>-->
<!--            </Tooltip>-->
        </template>
        </Table>
      </dz-table>
    </Card>
    <Drawer
      :title="formTitle"
      v-model="formModel.opened"
      width="600"
      :mask-closable="false"
      :mask="true"
      :styles="styles"
    >
      <Form :model="formModel.fields" ref="formUser" :rules="formModel.rules" label-position="top">
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="登录名" prop="loginName">
              <Input v-model="formModel.fields.loginName" placeholder="请输入登录名"/>
            </FormItem>
          </Col>
          <Col span="12">
            <FormItem label="真实名" prop="realName">
              <Input v-model="formModel.fields.realName" placeholder="请输入真实名"/>
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="密码" prop="passWord">
              <Input type="password" v-model="formModel.fields.passWord" v-show="false"/>
              <Input type="password" v-model="formModel.fields.passWord" placeholder="请输入登录密码"/>
            </FormItem>
          </Col>
          <Col span="12">
            <FormItem label="角色" prop="systemRoleUuid">
              <Select v-model="formModel.fields.systemRoleUuid">
                <Option
                  v-for="item in rolelist"
                  :value="item.systemRoleUuid"
                  :key="item.systemRoleUuid"
                >{{item.roleName}}</Option>
              </Select>
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="性别" prop="sex">
              <Select v-model="formModel.fields.sex">
                <Option value="男">男</Option>
                <Option value="女">女</Option>
              </Select>
            </FormItem>
          </Col>
          <Col span="12">
            <FormItem label="年龄" prop="age">
              <Input-number :value="18" min="1" max="120" v-model="formModel.fields.age" size="small"></Input-number>
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="昵称" prop="nickname">
              <Input v-model="formModel.fields.nickname" placeholder="请输入昵称"/>
            </FormItem>
          </Col>
          <Col span="12">
            <FormItem label="居住地" prop="placeofresidence">
              <Input v-model="formModel.fields.placeofresidence" placeholder="请输入居住地"/>
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
<!--          <Col span="12">-->
<!--            <FormItem label="身份证号" prop="userIdCard">-->
<!--              <Input v-model="formModel.fields.userIdCard" placeholder="请输入身份证号" :maxlength="18"/>-->
<!--            </FormItem>-->
<!--          </Col>-->
<!--          <Col span="12">-->
<!--            <FormItem label="科室" >-->
<!--              <Select v-model="formModel.fields.departmentUuid">-->
<!--                <Option-->
<!--                  v-for="item in departmentlist"-->
<!--                  :value="item.departmentUuid"-->
<!--                  :key="item.departmentUuid"-->
<!--                >{{item.departmentName}}</Option>-->
<!--              </Select>-->
<!--            </FormItem>-->
<!--          </Col>-->
        </Row>
      </Form>
      <div class="demo-drawer-footer">
        <Button icon="md-checkmark-circle" type="primary" @click="handleSubmitUser">保 存</Button>
        <Button style="margin-left: 8px" icon="md-close" @click="formModel.opened = false">取 消</Button>
      </div>
    </Drawer>

  </div>
</template>

<script>
import DzTable from "_c/tables/dz-table.vue";
import {
  getUserList,
  createUser,
  loadUser,
  editUser,
  deleteUser,
  batchCommand,
} from "@/api/rbac/user";
import { loadRoleListByUserGuid,loadSimpleList } from "@/api/rbac/role";

import {
    globalvalidateIDCardNoMust,
    globalvalidatepwd,
    globalvalidateIsNotEmpty
    } from "@/global/validate"
export default {
  name: "rbac_user_page",
  components: {
    DzTable
  },
  data() {
    return {
      commands: {
        delete: { name: "delete", title: "删除" },
        recover: { name: "recover", title: "恢复" },
        // forbidden: { name: "forbidden", title: "禁用" },
        // normal: { name: "normal", title: "启用" }
      },
      formModel: {
        opened: false,
        title: "创建用户",
        mode: "create",
        selection: [],
        fields: {
          loginName: "",
          realName: "",
          passWord: "",
          addPeople:"",
          //avatar: "",
          userType: 0,
          //isLocked: 0,
          //status: 1,
          isDeleted: 0,
            systemRoleUuid:'',
            userIdCard:'',
            departmentUuid:''
        },
        rules: {
          loginName: [
            { validator:globalvalidateIsNotEmpty,type: "string", required: true, message: "请输入登录名", min: 3 }
          ],
          realName: [{ validator:globalvalidateIsNotEmpty,type: "string", required: true, message: "请输入真实名" }],
          passWord: [{ validator:globalvalidatepwd,type: "string", required: true}],
          systemRoleUuid:[{required: true, message: "请选择角色" }],
          userIdCard:[{validator:globalvalidateIDCardNoMust,message: "请输入正确的身份证号",trigger: "blur"}]
        }
      },
      formAssignRole: {
        userGuid: "",
        opened: false,
        ownedRoles: [],
        inited: false,
        roles: []
      },
      stores: {
        user: {
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
            userTypes: [
              { value: 0, text: "超级管理员" },
              { value: 1, text: "管理员" },
              { value: 2, text: "普通用户" }
            ],
            isDeletedSources: [
              { value: -1, text: "全部" },
              { value: 0, text: "正常" },
              { value: 1, text: "已删" }
            ],
            statusSources: [
              { value: -1, text: "全部" },
              { value: 0, text: "禁用" },
              { value: 1, text: "正常" }
            ],
            statusFormSources: [
              { value: 0, text: "禁用" },
              { value: 1, text: "正常" }
            ]
          },
          columns: [
            { type: "selection", width: 50, key: "handle" },
            { title: "登录名", key: "loginName",  sortable: true },
            { title: "真实名", key: "realName",  },
              // { title: "身份证号", key: "userIdCard",  },
              // { title: "科室名", key: "departmentName"},
            { title: "用户类型", key: "userType",slot:"userType" },

            { title: "创建时间",  ellipsis: true, tooltip: true, key: "addTime" },
            { title: "创建者", key: "addPeople" },
            { title: "操作", align: "center", width: 150, className: "table-command-column",slot:"action" }
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
        rolelist:[],
        departmentlist:[]
    };
  },
  computed: {
    formTitle() {
      if (this.formModel.mode === "create") {
        return "创建用户";
      }
      if (this.formModel.mode === "edit") {
        return "编辑用户";
      }
      return "";
    },
    selectedRows() {
      return this.formModel.selection;
    },
    selectedRowsId() {
      return this.formModel.selection.map(x => x.systemUserUuid);
    }
  },
  methods: {
    loadUserList() {
      getUserList(this.stores.user.query).then(res => {
        this.stores.user.data = res.data.data;
        this.stores.user.query.totalCount = res.data.totalCount;
      });
    },
      doloadRoleList(){
          loadSimpleList().then(res=>{
              this.rolelist = res.data.data;
          })
      },
      // doloadDepartmentListdetail(){
      //     loaddepartmentListDetail().then(res=>{
      //         console.log(res.data)
      //         this.departmentlist = res.data.data;
      //     })
      // },
    handleOpenFormWindow() {
      this.formModel.opened = true;
    },
    handleCloseFormWindow() {
      this.formModel.opened = false;
    },
    handleSwitchFormModeToCreate() {
      this.formModel.mode = "create";
    },
    handleSwitchFormModeToEdit() {
      this.formModel.mode = "edit";
      this.handleOpenFormWindow();
    },
    handleEdit(row) {
      this.handleSwitchFormModeToEdit();
      this.handleResetFormUser();
      this.doLoadUser(row.systemUserUuid);
    },
    handleSelect(selection, row) {},
    handleSelectionChange(selection) {
      this.formModel.selection = selection;
    },
    handleRefresh() {
      this.loadUserList();
    },
    handleShowCreateWindow() {
      this.handleSwitchFormModeToCreate();
      this.handleOpenFormWindow();
      this.handleResetFormUser();
    },
    handleSubmitUser() {
      let valid = this.validateUserForm();
        //console.log(valid);
        //console.log(this.formModel.fields);
      if (valid) {
        if (this.formModel.mode === "create") {
          this.doCreateUser();
        }
        if (this.formModel.mode === "edit") {
          this.doEditUser();
        }
      }
    },
    handleResetFormUser() {
      this.$refs["formUser"].resetFields();
    },
    doCreateUser() {
      this.formModel.fields.addPeople=this.$store.state.user.userName;
      createUser(this.formModel.fields).then(res => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.handleCloseFormWindow();
          this.loadUserList();
        } else {
          this.$Message.warning(res.data.message);
        }
      });
    },
    doEditUser() {
      this.formModel.fields.addPeople=this.$store.state.user.userName;
      editUser(this.formModel.fields).then(res => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.handleCloseFormWindow();
          this.loadUserList();
        } else {
          this.$Message.warning(res.data.message);
        }
      });
    },
    validateUserForm() {
      let _valid = false;
      this.$refs["formUser"].validate(valid => {
        if (!valid) {
          this.$Message.error("请完善表单信息");
        } else {
          _valid = true;
        }
      });
      return _valid;
    },
    doLoadUser(systemUserUuid) {
      loadUser({ guid: systemUserUuid}).then(res => {
        // console.log(res.data.data);
        this.formModel.fields = res.data.data.query;
      });
    },
    handleDelete(row) {
      this.doDelete(row.systemUserUuid);
    },
    doDelete(ids) {
      if (!ids) {
        this.$Message.warning("请选择至少一条数据");
        return;
      }
      deleteUser(ids).then(res => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.loadUserList();
          this.formModel.selection = [];
        } else {
          this.$Message.warning(res.data.message);
        }
      });
    },
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
    },
    doBatchCommand(command) {
      batchCommand({
        command: command,
        ids: this.selectedRowsId.join(",")
      }).then(res => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.loadUserList();
          this.formModel.selection = [];
        } else {
          this.$Message.warning(res.data.message);
        }
        this.$Modal.remove();
      });
    },
    handleSearchUser() {
      this.loadUserList();
    },
    rowClsRender(row, index) {
      if (row.isDeleted) {
        return "table-row-disabled";
      }
      return "";
    },
    handleSortChange(column) {
      this.stores.user.query.sort.direction = column.order;
      this.stores.user.query.sort.field = column.key;
      this.loadUserList();
    },
    handlePageChanged(page) {
      this.stores.user.query.currentPage = page;
      this.loadUserList();
    },
    handlePageSizeChanged(pageSize) {
      this.stores.user.query.pageSize = pageSize;
      this.loadUserList();
    },
    // renderOwnedRoles(item) {
    //   return item.label;
    // },
    // handleChangeOwnedRolesChanged(newTargetKeys, direction, moveKeys) {
    //   this.formAssignRole.ownedRoles = newTargetKeys;
    // },
    // loadUserRoleList(guid) {
    //   this.formAssignRole.roles = [];
    //   this.formAssignRole.ownedRoles = [];
    //   loadRoleListByUserGuid(guid).then(res => {
    //     var result = res.data.data;
    //     this.formAssignRole.roles = result.roles;
    //     this.formAssignRole.ownedRoles = result.assignedRoles;
    //   });
    // },
    // handleAssignRole(row) {
    //   this.formAssignRole.opened = true;
    //   this.formAssignRole.userGuid = row.guid;
    //   this.loadUserRoleList(row.guid);
    // },
    // handleSaveUserRoles() {
    //   var data = {
    //     userGuid: this.formAssignRole.userGuid,
    //     assignedRoles: this.formAssignRole.ownedRoles
    //   };
    //   saveUserRoles(data).then(res => {
    //     this.formAssignRole.opened = false;
    //     if (res.data.code === 200) {
    //       this.$Message.success(res.data.message);
    //     } else {
    //       this.$Message.warning(res.data.message);
    //     }
    //   });
    // },
    renderUserType(userType){
      // console.log(userType);
      var userTypeText = "未知";
      if(userType!=null&&userType!=""){
        userTypeText=userType;
      }
      // switch (userType) {
      //   case 0:
      //     userTypeText = "超级管理员";
      //     break;
      //   case 1:
      //     userTypeText = "管理员";
      //     break;
      //   case 2:
      //     userTypeText = "普通用户";
      //     break;
      // }
      return userTypeText;
    },
    renderStatus(status){
      let _status = {
        color:"success",
        text:"正常"
      };
      switch(status){
        case 0:
        _status.text = "禁用";
        _status.color = "error";
        break;
      }
      return _status;
    }
  },
  mounted() {
    this.loadUserList();
    this.doloadRoleList();
    //this.doloadDepartmentListdetail();
  }
};
</script>

<style>
</style>
