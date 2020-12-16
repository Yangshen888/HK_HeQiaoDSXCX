<template>
  <div>
    <fieldset>
      <legend class="legend">宣传视频</legend>
      <Row>
        <Upload
          ref="vupload"
          multiple
          :action="vactionurl"
          :headers="postheaders"
          :show-upload-list="true"
          :data="{fileSavePath:'Scene/Video'}"
          :on-success="vshowUpResult"
          :on-progress="vtoUpResult"
          :max-size="30720"
          :on-exceeded-size="vhandleMaxSize"
          style="float:left"
          :disabled="vupdisabled"
          :on-remove="vdeleteFile"
        >
          <Button type="primary" icon="ios-cloud-upload-outline" :loading="vloadingStatus">上传视频</Button>
        </Upload>
      </Row>
      <Row v-if="formModel.fields.video!=null">
        <Card>
          <p slot="title">视频文件(不超过30M)</p>
          <p>{{this.formModel.fields.video}}</p>
          <Button @click="download">查看</Button>
        </Card>
      </Row>

    </fieldset>

    <div style="margin-top: 100px">
      <Button icon="md-checkmark-circle" type="primary" @click="handleSubmitPlan">保 存</Button>
    </div>
  </div>
</template>

<script>
import {
  loadRelationships,
  createRelationships
} from "@/api/Strategy/Strategy";
import { getToken } from "@/libs/util";
import config from "@/config";
export default {
  name: "relationships",
  data() {
    return {
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

      url: "",
      updisabled: false,
      loadingStatus: false,
      actionurl: "",
      postheaders: "",

      formModel: {
        fields: {
          video: ""
        }
      }
    };
  },
  methods: {
    async vshowUpResult(e) {
      this.vloadingStatus = false;
      this.vupdisabled = false;
      if (e.code == "200") {
        this.$Message.success(e.message);
        console.log(this.formModel.fields.video);
        this.formModel.fields.video = e.data.fname;
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
    deletevideo(file) {
      console.log(file);
      console.log(this.vuploadList);
      this.vuploadList = this.vuploadList.filter(
        x => x.name != "UploadFiles/Scene/Video/" + file
      );
      this.formModel.fields.video = this.vuploadList
        .map(x => x.fileName)
        .join(",");
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
    vhandleMaxSize(file) {
      this.$Notice.warning({
        title: "文件过大",
        desc: file.name + "超过30M"
      });
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
    doloadRelationships() {
      this.uploadList = [];
      console.log(111);
      loadRelationships().then(res => {
        console.log(222);
        console.log(res);
        this.formModel.fields = res.data.data;
        // if (res.data.data.video != null) {
        //   let list = res.data.data.video;
        //     this.vuploadList.push({
        //       url: config.baseUrl.dev + "UploadFiles/Scene/Video/" + list,
        //       status: "finished",
        //       name: "UploadFiles/Scene/Video/" + list,
        //       fileName: list
        //     });
   
        // }
      });
    },
        download(){
      // console.log(this.url);
      window.location.href =  config.baseUrl.dev + "UploadFiles/Scene/Video/" +
          this.formModel.fields.video.replace("\\", "/");;
    },
    handleSubmitPlan() {
      createRelationships(this.formModel.fields).then(res => {
        if (res.data.code === 200) {
          this.$Message.success(res.data.message);
          this.doloadRelationships();
        } else {
          this.$Message.warning(res.data.message);
        }
      });
    }
  },
  mounted() {
    this.doloadRelationships();
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
