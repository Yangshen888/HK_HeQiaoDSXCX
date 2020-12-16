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
                    </Input>
                  </FormItem>
                </Form>
              </Col>
              <Col span="8" class="dnc-toolbar-btns">
                <ButtonGroup class="mr3">
                  <Button icon="md-refresh" title="刷新" @click="handleRefresh"></Button>
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
          @on-refresh="handleRefresh"
          @on-page-change="handlePageChanged"
          @on-page-size-change="handlePageSizeChanged"
        >
          <template slot-scope="{row,index}" slot="state">
            <span>{{renderState(row.state)}}</span>
          </template>
          <template slot-scope="{ row, index }" slot="action">
            <!-- <Poptip confirm :transfer="true" title="确定要删除吗?" @on-ok="handleDelete(row)">
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
            </Tooltip> -->

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
      :title="'详情'"
      v-model="formModellook.opened"
      width="400"
      :mask-closable="false"
      :mask="false"
      :styles="styles"
    >
      <Form
        v-if="formModellook.opened"
        :model="formModellook.fields"
        ref="formPlan"
        :rules="formModellook.rules"
        label-position="top"
      >
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="用户昵称" >
              <Input
                v-model="formModellook.fields.nickname"
                placeholder="用户昵称"
                style="width: 350px"
                :maxlength="20"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="宝藏内容" >
              <Input
                v-model="formModellook.fields.content"
                placeholder="宝藏内容"
                style="width: 350px"
                :maxlength="20"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row>
        <Row :gutter="16">
          <Col span="12">
            <FormItem label="获取时间" >
              <Input
                v-model="formModellook.fields.createtime"
                placeholder="获取时间"
                style="width: 350px"
                :maxlength="20"
                :readonly="true"
              />
            </FormItem>
          </Col>
        </Row>

      </Form>
    </Drawer>

  </div>
</template>
<script>
  import DzTable from "_c/tables/dz-table.vue";
  import Tables from "_c/tables";
  import {
   onloadlist
  } from "@/api/Treasurerecord/treasurerecord";
  import { getToken } from "@/libs/util";
  import config from "@/config";
  export default {
    name: "scenicspot",
    components: {
      Tables,
      DzTable
    },
    data() {
      return {

          formModellook: {
          opened: false,
          title: "查看宝藏记录",
          mode: "create",
          selection: [],
          fields: {
            uid: "",
            useruid: "",
            nickname:"",
            picture:"",
            content:"",
            picture:"",
            createtime:"",
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
                  field: "ID"
                }
              ]
            },
            columns: [
            //{ type: "selection", width: 50, key: "handle" },
            //{ title: "用户头像", key: "picture" },
              { title: "用户昵称", key: "nickname" },
              { title: "宝藏内容", key: "content" },
              { title: "获取时间", key: "createtime"},
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

      };
    },
    methods: {
        //加载所有数据
      loadlist() {
        onloadlist(this.stores.scenicspot.query).then(res => {
            // console.log("宝藏数据")
            // console.log(res)
          this.stores.scenicspot.data = res.data.data;
          this.stores.scenicspot.query.totalCount = res.data.totalCount;
          //console.log(this.stores.educaplan.data);
        });
      },
      handleSearchScenicspot() {
        this.stores.scenicspot.query.currentPage = 1;
        this.loadlist();
      },
      handleRefresh() {
        this.stores.scenicspot.query.currentPage = 1;
        this.loadlist();
      },


      //点击查看
      handleShow(row){
        //   console.log("点击了查看")
        //   console.log(row)
          this.formModellook.opened=true;
          this.formModellook.fields=row;
      },

  





      handlePageChanged(page) {
        this.stores.scenicspot.query.currentPage = page;
        this.loadlist();
      },
      handlePageSizeChanged(pageSize) {
        this.stores.scenicspot.query.pageSize = pageSize;
        this.loadlist();
      }
    },
    mounted() {
      this.loadlist();
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
