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
                      <Select
                        slot="prepend"
                        v-model="stores.scenicspot.query.state"
                        @on-change="handleSearchScenicspot"
                        placeholder="发布状态"
                        style="width: 60px"
                      >
                        <Option
                          v-for="item in stores.scenicspot.sources.stateSources"
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
                  title="新增景点设施"
                  >新增景点设施</Button
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
            <FormItem label="景点设施名称" prop="name">
              <Input
                v-model="formModel.fields.name"
                placeholder="请输入景点设施名称"
                style="width: 400px"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="景点设施介绍" prop="spotContent">
              <Input
                v-model="formModel.fields.spotContent"
                placeholder="请输入景点设施介绍"
                style="width: 400px"
                type="textarea"
                :rows="15"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="设施类型" prop="type">
              <Select
                v-model="formModel.fields.type"
                placeholder="请选择设施类型"
                style="width: 400px"
              >
                <Option
                  v-for="item in stores.scenicspot.sources.sheshi"
                  :value="item.value"
                  :key="item.value"
                  >{{ item.text }}</Option
                >
              </Select>
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="所属景区" prop="tourismUuid">
              <Select
                v-model="formModel.fields.tourismUuid"
                placeholder="发布状态"
                style="width: 400px"
              >
                <Option
                  v-for="item in stores.scenicspot.sources.jingqu"
                  :value="item.value"
                  :key="item.value"
                  >{{ item.label }}</Option
                >
              </Select>
            </FormItem>
          </Col>
        </Row>

        <Row :gutter="16">
          <Col span="12">
            <FormItem label="景点设施地址" prop="address">
              <Input
                v-model="formModel.fields.address"
                placeholder="请输入景点设施"
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

        <Row :gutter="16">
          <Col span="12">
            <FormItem label="所属分类" prop="playType">
              <RadioGroup v-model="formModel.fields.playType">
                <Radio label="古镇游"></Radio>
                <Radio label="周边游"></Radio>
              </RadioGroup>
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
            <FormItem label="排序编号" prop="orderBy">
              <Input
                v-model="formModel.fields.orderBy"
                @keyup.native="
                  formModel.fields.orderBy = formModel.fields.orderBy.replace(
                    /[^\d]/g,
                    ''
                  )
                "
                placeholder="景点设施排序编号"
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
          <Col span="12">
            <FormItem label="是否推荐" label-position="left">
              <i-switch size="large" v-model="formModel.fields.isRecommend">
                <span slot="open">是</span>
                <span slot="close">否</span>
              </i-switch>
            </FormItem>
          </Col>
        </Row>

        <fieldset>
          <legend class="legend">景区图片(推荐大小370*330)</legend>
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
              :data="{ fileSavePath: 'Scene/Picture' }"
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
            <!--          <Modal title="查看图片" v-model="visible">-->
            <!--            <img :src="imgName" v-if="visible" style="width: 100%" />-->
            <!--          </Modal>-->
          </Row>
        </fieldset>

        <!-- <fieldset>
          <legend class="legend">景区视频(不超过30M)</legend>
          <Row style="padding: 15px">
            <Upload
              ref="vupload"
              multiple
              :action="vactionurl"
              :headers="postheaders"
              :show-upload-list="true"
              :data="{ fileSavePath: 'Scene/Video' }"
              :on-success="vshowUpResult"
              :on-progress="vtoUpResult"
              :max-size="20480"
              :on-exceeded-size="vhandleMaxSize"
              style="float: left"
              :disabled="vupdisabled"
              :on-remove="vdeleteFile"
            >
              <Button
                type="primary"
                icon="ios-cloud-upload-outline"
                :loading="vloadingStatus"
                >上传视频</Button
              >
            </Upload>
          </Row>
          <Row
            v-if="
              formModel.fields.video != null &&
              formModel.fields.video.length > 0
            "
          >
            <Card>
              <p slot="title">视频文件</p>
              <p v-for="item in formModel.fields.video.split(',')">
                {{ item }}
                <Button @click="deletevideo(item)">删除</Button>
              </p>
              <!-- <Button @click="download">下载</Button> -->
            <!-- </Card>
          </Row>
        </fieldset> -->

        <fieldset>
          <legend class="legend">景区音频</legend>
          <Row style="padding: 15px">
            <Upload
              ref="aupload"
              multiple
              :action="aactionurl"
              :headers="postheaders"
              :show-upload-list="true"
              :data="{ fileSavePath: 'Scene/Audio' }"
              :on-success="ashowUpResult"
              :on-progress="atoUpResult"
              :max-size="20480"
              :on-exceeded-size="ahandleMaxSize"
              style="float: left"
              :disabled="aupdisabled"
              :on-remove="adeleteFile"
            >
              <Button
                type="primary"
                icon="ios-cloud-upload-outline"
                :loading="aloadingStatus"
                >上传音频</Button
              >
            </Upload>
          </Row>
          <Row
            v-if="
              formModel.fields.audio != null &&
              formModel.fields.audio.length > 0
            "
          >
            <Card>
              <p slot="title">音频文件</p>
              <p v-for="item in formModel.fields.audio.split(',')">
                {{ item }}
                <Button @click="deleteaudio(item)">删除</Button>
              </p>
              <!-- <Button @click="download">下载</Button> -->
            </Card>
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
            <FormItem label="景点设施名称">
              <Input
                v-model="formModel.fields.name"
                placeholder="请输入景点设施名称"
                style="width: 400px"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="景点设施介绍">
              <Input
                v-model="formModel.fields.spotContent"
                placeholder="请输入景点设施介绍"
                style="width: 400px"
                type="textarea"
                :rows="15"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="设施类型" prop="type">
              <Select
                v-model="formModel.fields.type"
                placeholder="请选择设施类型"
                style="width: 400px"
                :disabled="true"
              >
                <Option
                  v-for="item in stores.scenicspot.sources.sheshi"
                  :value="item.value"
                  :key="item.value"
                  >{{ item.text }}</Option
                >
              </Select>
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="所属景区" prop="tourismUuid">
              <Select
                v-model="formModel.fields.tourismUuid"
                placeholder="发布状态"
                style="width: 400px"
                :disabled="true"
              >
                <Option
                  v-for="item in stores.scenicspot.sources.jingqu"
                  :value="item.value"
                  :key="item.value"
                  >{{ item.label }}</Option
                >
              </Select>
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="景点设施地址">
              <Input
                v-model="formModel.fields.address"
                placeholder="请输入景点设施地址"
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
            <FormItem label="排序编号">
              <Input
                v-model="formModel.fields.orderBy"
                @keyup.native="
                  formModel.fields.orderBy = formModel.fields.orderBy.replace(
                    /[^\d]/g,
                    ''
                  )
                "
                placeholder="景点设施排序编号"
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
          <Col span="12">
            <FormItem label="是否推荐" label-position="left">
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
            <!--            <Divider dashed />-->
            <!--            <Upload-->
            <!--              ref="upload"-->
            <!--              :show-upload-list="false"-->
            <!--              :default-file-list="defaultList"-->
            <!--              :on-success="showUpResult"-->
            <!--              :on-progress="toUpResult"-->
            <!--              :format="['jpg','jpeg','png']"-->
            <!--              :max-size="5120"-->
            <!--              :data="{fileSavePath:'Scene/Picture'}"-->
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

        <!-- <fieldset>
          <legend class="legend">景区视频</legend> -->
          <!--          <Row style="padding: 15px">-->
          <!--            <Upload-->
          <!--              ref="vupload"-->
          <!--              multiple-->
          <!--              :action="vactionurl"-->
          <!--              :headers="postheaders"-->
          <!--              :show-upload-list="true"-->
          <!--              :data="{fileSavePath:'Scene/Video'}"-->
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
          <!-- <Row
            v-if="
              formModel.fields.video != null &&
              formModel.fields.video.length > 0
            "
            style="padding: 15px"
          >
            <Card>
              <p slot="title">视频文件</p>
              <p v-for="item in formModel.fields.video.split(',')">
                {{ item }}
                <Button @click="deletevideo(item)">删除</Button>
                <Button @click="downloadvideo(item)">下载</Button>
              </p>
            </Card>
          </Row>
        </fieldset> -->

        <fieldset>
          <legend class="legend">景区音频</legend>
          <!--          <Row style="padding: 15px">-->
          <!--            <Upload-->
          <!--              ref="aupload"-->
          <!--              multiple-->
          <!--              :action="aactionurl"-->
          <!--              :headers="postheaders"-->
          <!--              :show-upload-list="true"-->
          <!--              :data="{fileSavePath:'Scene/Audio'}"-->
          <!--              :on-success="ashowUpResult"-->
          <!--              :on-progress="atoUpResult"-->
          <!--              :max-size="20480"-->
          <!--              :on-exceeded-size="ahandleMaxSize"-->
          <!--              style="float:left"-->
          <!--              :disabled="aupdisabled"-->
          <!--              :on-remove="adeleteFile">-->
          <!--              <Button type="primary" icon="ios-cloud-upload-outline" :loading="aloadingStatus">上传视频</Button>-->
          <!--            </Upload>-->
          <!--          </Row>-->
          <Row
            v-if="
              formModel.fields.audio != null &&
              formModel.fields.audio.length > 0
            "
            style="padding: 15px"
          >
            <Card>
              <p slot="title">音频文件</p>
              <p v-for="item in formModel.fields.audio.split(',')">
                {{ item }}
                <!--                <Button @click="deleteaudio(item)">删除</Button>-->
                <Button @click="downloadaudio(item)">下载</Button>
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
  getScenicspotList,
  createScenicspot,
  loadScenicspot,
  editScenicspot,
  deleteScenicspot,
  getjingqu,
  batchCommand,
  deletetoFile,
} from "@/api/scene/scenicspot";
import { getToken } from "@/libs/util";
import config from "@/config";
export default {
  name: "scenicspot",
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
        title: "创建景点设施",
        mode: "create",
        selection: [],
        fields: {
          name: "",
          spotContent: "",
          address: "",
          orderBy: "",
          shopId: 0,
          state: 0,
          picture: "",
          video: "",
          playType: "",
          lon: "",
          lat: "",
          audio: "",
          tourismUuid: "",
          type: "",
          isRecommend: false,
        },
        rules: {
          name: [
            {
              type: "string",
              required: true,
              message: "请输入景点设施名称",
              trigger: "blur",
            },
          ],
          spotContent: [
            {
              type: "string",
              required: true,
              message: "请输入景点设施介绍",
              trigger: "blur",
            },
          ],
          address: [
            {
              type: "string",
              required: true,
              message: "请输入景点设施地址",
              trigger: "blur",
            },
          ],
          tourismUuid: [
            {
              type: "string",
              required: true,
              message: "请选择所属景区",
            },
          ],
          type: [
            {
              type: "string",
              required: true,
              message: "请选择设施类型",
            },
          ],
          playType: [
            {
              type: "string",
              required: true,
              message: "请选择分类",
            },
          ],
          orderBy: [
            { required: true, message: "请输入序号" },
            { validator: checkNum, trigger: "blur" },
          ],
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
            sheshi: [
              { value: "景区设施", text: "景区设施" },
              { value: "公共设施", text: "公共设施" },
            ],
            jingqu: [],
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
            { title: "景点设施名称", key: "name" },
            { title: "地址", key: "address" },
            { title: "类型", key: "playType" },
            { title: "排序编号", key: "orderBy" },
            { title: "商品编号", key: "shopId" },
            // { title: "是否启用", key: "isEnable"},
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
        spotContent: "",
        address: "",
        orderBy: "",
        state: 0,
        shopId: 0,
        picture: "",
        video: "",
        playType: "",
        lon: "",
        lat: "",
        audio: "",
        tourismUuid: "",
        type: "",
        isRecommend: false,
      },
    };
  },
  computed: {
    formTitle() {
      if (this.formModel.mode === "create") {
        return "新增景点设施";
      }
      if (this.formModel.mode === "edit") {
        return "编辑景点设施";
      }
      return "";
    },
    selectedRows() {
      return this.formModel.selection;
    },
    selectedRowsId() {
      return this.formModel.selection.map((x) => x.scenicSpotUuid);
    },
  },
  methods: {
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
        this.formModel.fields.playType =
          this.formModel.fields.playType == "古镇游" ? "1" : "2";
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
      this.doDelete(row.scenicSpotUuid);
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
      this.doLoadScenicspot(row.scenicSpotUuid);
    },
    handleShow(row) {
      this.formModel1.opened = true;
      this.handleResetFormRole();
      this.doLoadScenicspot(row.scenicSpotUuid);
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
        console.log(res);
        this.formModel.fields = res.data.data;
        this.formModel.fields.playType =
          this.formModel.fields.playType == "1" ? "古镇游" : "周边游";
        console.log(this.formModel.fields);
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
    jingquxiala() {
      getjingqu().then((res) => {
        //console.log(res);
        this.stores.scenicspot.sources.jingqu = res.data.data;
        console.log(this.stores.scenicspot.sources.jingqu);
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
    this.jingquxiala();
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
