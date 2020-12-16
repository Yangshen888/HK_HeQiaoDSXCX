<template>
  <div>
    <Card>
      <dz-table
        :totalCount="stores.hotel.query.totalCount"
        :pageSize="stores.hotel.query.pageSize"
        :currentPage="stores.hotel.query.currentPage"
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
                      v-model="stores.hotel.query.kw"
                      placeholder="输入名称搜索..."
                      @on-search="handleSearchHotel()"
                    >
                      <Select
                        slot="prepend"
                        v-model="stores.hotel.query.isDeleted"
                        @on-change="handleSearchHotel"
                        placeholder="删除状态"
                        style="width: 60px"
                      >
                        <Option
                          v-for="item in stores.hotel.sources.isDeletedSources"
                          :value="item.value"
                          :key="item.value"
                          >{{ item.text }}</Option
                        >
                      </Select>
                      <Select
                        slot="prepend"
                        v-model="stores.hotel.query.state"
                        @on-change="handleSearchHotel"
                        placeholder="发布状态"
                        style="width: 60px"
                      >
                        <Option
                          v-for="item in stores.hotel.sources.stateSources"
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
          :data="stores.hotel.data"
          :columns="stores.hotel.columns"
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
              content="房型信息"
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
        ref="formPlanss"
        :rules="formModel.rules"
        label-position="top"
      >
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="名称" prop="name">
              <Input
                v-model="formModel.fields.name"
                placeholder="请输入名称"
                style="width: 400px"
              />
            </FormItem>
          </Col>
        </Row>

        <fieldset>
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
              :data="{ fileSavePath: 'Hotel' }"
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
        </fieldset>

        <Row :gutter="16" style="margin-top: 20px">
          <Col span="12">
            <FormItem label="电话" prop="phone">
              <Input
                v-model="formModel.fields.phone"
                placeholder="请输入电话"
                style="width: 400px"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
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
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="地址" prop="address">
              <Input
                v-model="formModel.fields.address"
                placeholder="请输入地址"
                style="width: 400px"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="价格" prop="price">
              <Input
                v-model="formModel.fields.price"
                placeholder="请输入价格"
                style="width: 400px"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="商品编号" prop="shopId">
              <Input
                v-model="formModel.fields.shopId"
                placeholder="请输入商品编号"
                style="width: 400px"
              />
            </FormItem>
          </Col>
        </Row>
        <!-- <Row :gutter="16">
          <Col span="12">
            <FormItem label="酒店链接" prop="hotelUrl">
              <Input
                v-model="formModel.fields.hotelUrl"
                placeholder="请输入酒店链接"
                style="width: 400px"
              />
            </FormItem>
          </Col>
        </Row> -->

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
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="发布时间" prop="createTime">
              <DatePicker
                type="date"
                v-model="formModel.fields.createTime"
                placeholder="请选择发布时间"
                :editable="false"
                style="width: 400px"
              ></DatePicker>
            </FormItem>
          </Col>
        </Row>
        <fieldset>
          <legend class="legend">图片(推荐大小530*230)</legend>
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
              :data="{ fileSavePath: 'Hotel' }"
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

    <Modal title="查看图片" v-model="visible">
      <img :src="imgName" v-if="visible" style="width: 100%" />
    </Modal>

    <Drawer
      title="酒店房型信息"
      v-model="stores1.opened"
      width="80%"
      :mask-closable="false"
      :mask="true"
      @on-close="onclose"
    >
      <Card>
        <dz-table
          :totalCount="stores1.demo.query.totalCount"
          :pageSize="stores1.demo.query.pageSize"
          @on-page-change="ohandlePageChanged"
          @on-page-size-change="ohandlePageSizeChanged"
        >
          <div slot="searcher">
            <section class="dnc-toolbar-wrap">
              <Row :gutter="16">
                <Col span="14" class="dnc-toolbar-btns" style="width: 100%">
                  <ButtonGroup class="mr3">
                    <Button
                      v-can="'delete1'"
                      class="txt-danger"
                      icon="md-trash"
                      title="删除"
                      @click="ohandleBatchCommand('delete')"
                    ></Button>
                    <Button
                      icon="md-refresh"
                      title="刷新"
                      @click="ohandleRefresh"
                    ></Button>
                  </ButtonGroup>
                  <Button
                    icon="md-create"
                    type="primary"
                    @click="ohandleShowCreateWindow"
                    title="添加"
                    >添加</Button
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
            :data="stores1.demo.data"
            :columns="stores1.demo.columns"
            @on-select="ohandleSelect"
            @on-selection-change="ohandleSelectionChange"
            @on-refresh="ohandleRefresh"
            :row-class-name="orowClsRender"
            @on-page-change="ohandlePageChanged"
            @on-page-size-change="ohandlePageSizeChanged"
          >
            <template slot-scope="{ row, index }" slot="actionInfo">
              <Tooltip
                placement="top"
                content="编辑"
                :delay="1000"
                :transfer="true"
              >
                <Button
                  type="primary"
                  size="small"
                  shape="circle"
                  icon="md-create"
                  @click="ohandleEdit(row)"
                ></Button>
              </Tooltip>
            </template>
          </Table>
        </dz-table>
      </Card>
    </Drawer>
    <Drawer
      :title="oformTitle"
      v-model="formModel1.opened"
      width="600"
      :mask-closable="false"
      :mask="true"
    >
      <Form
        :model="formModel1.fields"
        ref="oformdispatch"
        :rules="formModel1.rules"
        label-position="top"
      >
        <Row :gutter="16">
          <FormItem label="房型名称" prop="hotelRoomName">
            <Input
              v-model="formModel1.fields.hotelRoomName"
              :readonly="ocheckShow()"
              placeholder="请输入房型名称"
            />
          </FormItem>
        </Row>
        <Row :gutter="16">
          <FormItem label="价格" prop="price">
            <Input
              v-model="formModel1.fields.price"
              :readonly="ocheckShow()"
              placeholder="请输入价格"
            />
          </FormItem>
        </Row>
        <Row :gutter="16">
          <FormItem label="房型介绍" prop="introduction">
            <Input
              v-model="formModel1.fields.introduction"
              :readonly="ocheckShow()"
              placeholder="请输入房型介绍"
              type="textarea"
              :rows="15"
            />
          </FormItem>
        </Row>
        <fieldset>
          <legend class="legend">房间图片</legend>
          <Row style="padding: 15px">
            <div class="demo-upload-list" v-for="item in roomList">
              <template v-if="item.status === 'finished'">
                <img :src="item.url" />
                <div class="demo-upload-list-cover">
                  <Icon
                    type="ios-eye-outline"
                    @click.native="handleView2(item.url)"
                  ></Icon>
                  <Icon
                    type="ios-trash-outline"
                    @click.native="handleRemove2(item.name)"
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
              :default-file-list="roomdefaultList"
              :on-success="showUpResult2"
              :on-progress="toUpResult2"
              :format="['jpg', 'jpeg', 'png']"
              :max-size="5120"
              :data="{ fileSavePath: 'Hotel' }"
              :on-format-error="handleFormatError2"
              :on-exceeded-size="handleMaxSize2"
              :before-upload="handleBeforeUpload2"
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
        </fieldset>
        <!-- <Row :gutter="16">
          <FormItem label="照片" prop="picture">
            <Input
              type="textarea"
              :autosize="true"
              v-model="formModel1.fields.picture"
              :readonly="ocheckShow()"
              placeholder="请输入照片"
            />
          </FormItem>
        </Row> -->
      </Form>
      <div class="demo-drawer-footer">
        <Button
          icon="md-checkmark-circle"
          type="primary"
          @click="ohandleSubmitConsumable"
          v-if="!ocheckShow()"
          >保 存</Button
        >
        <Button style="margin-left: 30px" icon="md-close" @click="formopen1"
          >取 消</Button
        >
      </div>
    </Drawer>
  </div>
</template>
<script>
import DzTable from "_c/tables/dz-table.vue";
import Tables from "_c/tables";
import {
  getHotelList,
  createHotel,
  loadHotel,
  editHotel,
  batchCommand,
  deleteHotel,
  getDecompInfoList,
  createDecompInfo,
  loadDecompInfo,
  editDecompInfo,
  deleteDecompInfo,
  batchDecompInfoCommand,
} from "@/api/intelligentguide/hotel";
import { deletetoFile } from "@/api/common/common";
import { getToken } from "@/libs/util";
import config from "@/config";
export default {
  name: "hotel",
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
      commands: {
        delete: { name: "delete", title: "删除" },
        recover: { name: "recover", title: "恢复" },
        forbidden: { name: "forbidden", title: "禁用" },
        normal: { name: "normal", title: "启用" },
      },
      ocommands: {
        delete: { name: "delete", title: "删除" },
        recover: { name: "recover", title: "恢复" },
        Import: { name: "Import", title: "导入" },
        export: { name: "export", title: "导出" },
      },
      coveruploadList: [],
      coverdefaultList: [],
      coverloadingStatus: false,
      coverupdisabled: false,

      uploadList: [],
      defaultList: [],
      roomList: [],
      roomdefaultList: [],

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
        title: "创建特色采摘",
        mode: "create",
        selection: [],
        fields: {
          name: "",
          cover: "",
          phone: "",
          introduction: "",
          address: "",
          price: "",
          createTime: "",
          hotelUrl: "",
          picture: "",
          lon: "",
          lat: "",
          state: 0,
          shopId: 0,
        },
        rules: {
          name: [
            {
              type: "string",
              required: true,
              message: "请输入名称",
              trigger: "blur",
            },
          ],
          address: [
            {
              type: "string",
              required: true,
              message: "请输入地址",
              trigger: "blur",
            },
          ],
          createTime: [
            {
              required: true,
              message: "请选择时间",
            },
          ],
          price: [
            {
              type: "string",
              required: true,
              message: "请输入价格",
              trigger: "blur",
            },
          ],
          lon: [{ type: "string", required: true, validator: validateLon }],
          lat: [{ type: "string", required: true, validator: validateLat }],
        },
      },
      stores: {
        hotel: {
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
            { title: "名称", key: "name", tooltip: true, ellipsis: true },
            { title: "电话", key: "phone", tooltip: true, ellipsis: true },
            { title: "地址", key: "address", tooltip: true, ellipsis: true },
            { title: "价格", key: "price", tooltip: true, ellipsis: true },
            { title: "商品编号", key: "shopId" },
            {
              title: "发布时间",
              key: "createTime",
              tooltip: true,
              ellipsis: true,
            },
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
        name: "",
        cover: "",
        phone: "",
        introduction: "",
        address: "",
        price: "",
        createTime: "",
        hotelUrl: "",
        picture: "",
        lon: "",
        lat: "",
        state: 0,
        shopId: 0,
      },
      initdatacopy2: {
        hotelRoomUuid: "",
        hotelUuid: "",
        hotelRoomName: "",
        picture: "",
        introduction: "",
        price: "",
        Address: "",
      },

      stores1: {
        opened: false,
        demo: {
          query: {
            totalCount: 0,
            pageSize: 20,
            currentPage: 1,
            kw: "",
            kw1: "",
            hotelUuid: "",
            isDelete: 0,
            status: -1,
            sort: [
              {
                direct: "DESC",
                field: "ID",
              },
            ],
          },
          sources: {},
          //列表显示
          columns: [
            {
              type: "selection",
              width: 50,
              key: "hotelRoomUuid",
              _disabled: true,
            },
            { title: "房型名称", key: "hotelRoomName" },
            { title: "价格", key: "price" },
            { title: "房型介绍", key: "introduction" },
            {
              title: "操作",
              align: "center",
              width: 200,
              className: "table-command-column",
              slot: "actionInfo",
            },
          ],
          data: [],
        },
      },
      formModel1: {
        opened: false,
        title: "创建申请",
        mode: "create",
        dFileName: "xxxx",
        selection: [],
        fields: {
          hotelRoomUuid: "",
          hotelUuid: "",
          hotelRoomName: "",
          picture: "",
          introduction: "",
          price: "",
          Address: "",
        },
        rules: {},
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
      return this.formModel.selection.map((x) => x.hotelUuid);
    },
    oformTitle() {
      if (this.formModel1.mode === "create") {
        return "新增信息";
      }
      if (this.formModel1.mode === "edit") {
        return "编辑信息";
      }
      if (this.formModel1.mode === "show") {
        return "信息详情";
      }
      return "";
    },
    oselectedRows() {
      return this.formModel1.selection;
    },
    oselectedRowsId() {
      return this.formModel1.selection.map((x) => x.hotelRoomUuid);
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

    async showUpResult2(response, file, fileList) {
      this.loadingStatus = false;
      this.updisabled = false;
      if (response.code == "200") {
        this.$Message.success(response.message);
        console.log(this.formModel1.fields.picture);
        if (this.formModel1.fields.picture != null) {
          if (this.formModel1.fields.picture.length > 0) {
            this.formModel1.fields.picture += ",";
          }
          this.formModel1.fields.picture += response.data.fname;
        } else {
          this.formModel1.fields.picture = response.data.fname;
        }
        await this.roomList.push({
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
    toUpResult2() {
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
    handleFormatError2(file) {
      this.$Notice.warning({
        title: "The file format is incorrect",
        desc: "文件: " + file.name + " 不是png,jpg",
      });
    },
    handleMaxSize2(file) {
      this.$Notice.warning({
        title: "Exceeding file size limit",
        desc: "文件 " + file.name + " 太大,超过5M.",
      });
    },
    handleBeforeUpload2() {
      return true;
    },
    handleView2(name) {
      this.imgName = name;
      this.visible = true;
      console.log(this.imgName);
    },
    handleRemove2(file) {
      // const fileList = this.$refs.upload.fileList;
      // this.$refs.upload.fileList.splice(fileList.indexOf(file), 1);
      deletetoFile({ filePath: file }).then((res) => {
        if (res.data.code == "200") {
          this.roomList = this.roomList.filter((x) => x.name != file);
          this.formModel1.fields.picture = this.roomList
            .map((x) => x.fileName)
            .join(",");
        } else {
          this.roomList = this.roomList.filter((x) => x.name != file);
          this.formModel1.fields.picture = this.roomList
            .map((x) => x.fileName)
            .join(",");
          this.$Message.warning(res.data.message);
        }
      });
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
    onclose() {
      this.loadHotelList();
    },
    loadHotelList() {
      getHotelList(this.stores.hotel.query).then((res) => {
        this.stores.hotel.data = res.data.data;
        this.stores.hotel.query.totalCount = res.data.totalCount;
        //console.log(this.stores.educaplan.data);
      });
    },
    handleSearchHotel() {
      this.stores.hotel.query.currentPage = 1;
      this.loadHotelList();
    },
    handleRefresh() {
      this.stores.hotel.query.currentPage = 1;
      this.loadHotelList();
    },
    //创建，修改
    handleSubmitPlan() {
      let valid = this.validateForm();
      if (valid) {
        // console.log(this.coveruploadList);
        // console.log(this.uploadList);
        if (this.coveruploadList.length != 1) {
          this.$Message.warning("封面请只上传1张图片");
          return;
        }
        if (this.uploadList.length != 3) {
          this.$Message.warning("内容图片请上传3张图片");
          return;
        }
        if (this.formModel.mode === "create") {
          this.docreateHotel();
        }
        if (this.formModel.mode === "edit") {
          this.doEditPlan();
        }
      }
    },
    docreateHotel() {
      createHotel(this.formModel.fields).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.handleCloseFormWindow();
          this.loadHotelList();
        } else {
          this.$Message.warning(res.data.message);
        }
      });
    },
    doEditPlan() {
      editHotel(this.formModel.fields).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.handleCloseFormWindow();
          this.loadHotelList();
        } else {
          this.$Message.warning(res.data.message);
        }
      });
    },
    validateForm() {
      let _valid = false;
      this.$refs["formPlanss"].validate((valid) => {
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
          this.loadHotelList();
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
      this.doDelete(row.hotelUuid);
    },
    doDelete(ids) {
      if (!ids) {
        this.$Message.warning("请选择至少一条数据");
        return;
      }
      deleteHotel(ids).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.loadHotelList();
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
      this.doLoadHotel(row.hotelUuid);
    },
    handleShow(row) {
      this.stores1.demo.query.kw = row.hotelUuid;
      this.stores1.demo.query.hotelUuid = row.hotelUuid;
      this.formModel1.fields.hotelUuid = row.hotelUuid;
      // this.formModel1.fields.dangOrganizationUuid = e.dangOrganizationUuid;
      this.stores1.opened = true;
      this.oloadDispatchList();
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
      this.formModel1.fields = JSON.parse(JSON.stringify(this.initdatacopy2));
      this.coveruploadList = [];
      this.uploadList = [];
      this.roomList = [];
      //this.$refs["formPlan"].resetFields();
    },
    async doLoadHotel(guid) {
      loadHotel({ guid: guid }).then((res) => {
        this.formModel.fields = res.data.data;
        if (res.data.data.cover != null && res.data.data.cover != "") {
          let list = res.data.data.cover.split(",");
          for (let i = 0; i < list.length; i++) {
            this.coveruploadList.push({
              url: config.baseUrl.dev + "UploadFiles/Hotel/" + list[i],
              status: "finished",
              name: "UploadFiles/Hotel/" + list[i],
              fileName: list[i],
            });
          }
        }

        if (res.data.data.picture != null && res.data.data.picture != "") {
          let list = res.data.data.picture.split(",");
          for (let i = 0; i < list.length; i++) {
            this.uploadList.push({
              url: config.baseUrl.dev + "UploadFiles/Hotel/" + list[i],
              status: "finished",
              name: "UploadFiles/Hotel/" + list[i],
              fileName: list[i],
            });
          }
        }
      });
    },
    handlePageChanged(page) {
      this.stores.hotel.query.currentPage = page;
      this.loadHotelList();
    },
    handlePageSizeChanged(pageSize) {
      this.stores.hotel.query.pageSize = pageSize;
      this.loadHotelList();
    },

    //页面加载
    oloadDispatchList() {
      getDecompInfoList(this.stores1.demo.query).then((res) => {
        console.log(res);
        this.stores1.demo.data = res.data.data;
        this.stores1.demo.query.totalCount = res.data.totalCount;
      });
    },
    ohandleSelect(selection, row) {},
    //多选
    ohandleSelectionChange(selection) {
      this.formModel1.selection = selection;
    },
    //翻页
    ohandlePageChanged(page) {
      this.stores1.demo.query.currentPage = page;
      this.oloadDispatchList();
    },
    //显示条数改变
    ohandlePageSizeChanged(pageSize) {
      this.stores1.demo.query.pageSize = pageSize;
      this.oloadDispatchList();
    },
    //行样式
    orowClsRender(row, index) {
      if (row.isDeleted) {
        return "table-row-disabled";
      }
      return "";
    },
    //搜索
    ohandleSearchDispatch() {
      this.oloadDispatchList();
    },
    //刷新
    ohandleRefresh() {
      this.oloadDispatchList();
    },
    ocheckShow() {
      return this.formModel1.mode === "show";
    },
    formopen1() {
      this.formModel1.opened = false;
      this.oloadDispatchList();
    },
    formopen() {
      this.loadDispatchList();
    },
    //详情显示
    ohandleDetail(e) {
      this.formModel1.mode = "show";
      this.formModel1.opened = true;
      this.ohandleResetFormDispatch(); //清空表单
      this.odoLoadData(e.hotelRoomUuid);
    },
    //添加按钮
    ohandleShowCreateWindow() {
      this.formModel1.mode = "create";
      this.handleResetFormRole();
      this.ohandleResetFormDispatch(); //清空表单
      this.formModel1.opened = true;
    },
    //右边编辑
    ohandleEdit(row) {
      console.log(row);
      this.handleResetFormRole();
      this.formModel1.mode = "edit";
      this.formModel1.opened = true;
      this.ohandleResetFormDispatch(); //清空表单
      this.odoLoadData(row.hotelRoomUuid);
    },
    //查询当前行信息
    odoLoadData(id) {
      loadDecompInfo(id).then((res) => {
        if (res.data.code === 200) {
          this.formModel1.fields = res.data.data;
          if (res.data.data.picture != null && res.data.data.picture != "") {
            let list = res.data.data.picture.split(",");
            for (let i = 0; i < list.length; i++) {
              this.roomList.push({
                url: config.baseUrl.dev + "UploadFiles/Hotel/" + list[i],
                status: "finished",
                name: "UploadFiles/Hotel/" + list[i],
                fileName: list[i],
              });
            }
          }
        }
      });
    },
    //保存按钮
    ohandleSubmitConsumable() {
      if (this.formModel1.mode === "create") {
        this.odocreateDispatch();
      }
      if (this.formModel1.mode === "edit") {
        this.odoEditDispatch();
      }
    },
    //添加（保存）
    odocreateDispatch() {
      this.formModel1.fields.hotelUuid = this.stores1.demo.query.hotelUuid;
      createDecompInfo(this.formModel1.fields).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.formModel1.opened = false; //关闭表单
          this.stores1.opened = true;
          this.oloadDispatchList();
        } else {
          this.$Message.warning(res.data.message);
        }
      });
    },
    //编辑（保存）
    odoEditDispatch() {
      editDecompInfo(this.formModel1.fields).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.formModel1.opened = false; //关闭表单
          this.stores1.opened = true;
          this.oloadDispatchList();
        } else {
          this.$Message.warning(res.data.message);
        }
      });
    },
    //清空
    ohandleResetFormDispatch() {
      this.$refs["oformdispatch"].resetFields();
    },
    //右边删除（单个删除）
    ohandleDelete(row) {
      console.log(row.organPeoInfoUuid);
      this.odoDelete(row.organPeoInfoUuid);
    },
    odoDelete(ids) {
      if (!ids) {
        this.$Message.warning("请选择至少一条数据");
        return;
      }
      odeleteDepartment(ids).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.oloadDispatchList();
          this.stores1.opened = true;
          this.formModel1.selection = [];
        } else {
          this.$Message.warning(res.data.message);
        }
      });
    },
    //右上边删除按钮
    ohandleBatchCommand(command) {
      if (!this.oselectedRowsId || this.oselectedRowsId.length <= 0) {
        this.$Message.warning("请选择至少一条数据");
        return;
      }
      this.$Modal.confirm({
        title: "操作提示",
        content:
          "<p>确定要执行当前 [" +
          this.ocommands[command].title +
          "] 操作吗?</p>",
        loading: true,
        onOk: () => {
          this.odoBatchCommand(command);
        },
      });
    },
    //右上边删除
    odoBatchCommand(command) {
      batchDecompInfoCommand({
        command: command,
        ids: this.oselectedRowsId.join(","),
      }).then((res) => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.formModel1.selection = [];
          this.oloadDispatchList();
          this.stores1.opened = true;
        } else {
          this.$Message.warning(res.data.message);
        }
        this.$Modal.remove();
      });
    },
  },
  mounted() {
    this.loadHotelList();
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
