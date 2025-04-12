package
{
   import caurina.transitions.Tweener;
   import fl.controls.*;
   import fl.data.DataProvider;
   import fl.data.SimpleCollectionItem;
   import flash.display.*;
   import flash.events.*;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.net.*;
   import flash.system.*;
   import org.papervision3d.cameras.Camera3D;
   import org.papervision3d.core.math.*;
   import org.papervision3d.core.proto.MaterialObject3D;
   import org.papervision3d.events.InteractiveScene3DEvent;
   import org.papervision3d.lights.PointLight3D;
   import org.papervision3d.materials.*;
   import org.papervision3d.materials.shadematerials.FlatShadeMaterial;
   import org.papervision3d.materials.special.CompositeMaterial;
   import org.papervision3d.materials.utils.MaterialsList;
   import org.papervision3d.objects.DisplayObject3D;
   import org.papervision3d.objects.primitives.*;
   import org.papervision3d.render.BasicRenderEngine;
   import org.papervision3d.scenes.Scene3D;
   import org.papervision3d.view.Viewport3D;
   
   public class PV3DInteractive extends Sprite
   {
      private var lfFingerPinky01:Cube;
      
      private var ROTlfClavicle:DisplayObject3D;
      
      private var lfFingerPinky03:Cube;
      
      private var lfFingerPinky02:Cube;
      
      private var gizmoX:Cylinder;
      
      private var gizmoY:Cylinder;
      
      private var gizmoZ:Cylinder;
      
      private var lfmetaCarpal01:Cube;
      
      private var lfmetaCarpal02:Cube;
      
      private var lfmetaCarpal03:Cube;
      
      private var lfmetaCarpal05:Cube;
      
      private var playing:Boolean;
      
      private var TBDown:Boolean;
      
      private var ROTrtCalf:DisplayObject3D;
      
      private var kfNum:*;
      
      private var cube:Cube;
      
      private var ROTHead:DisplayObject3D;
      
      private var LoadedXAF:String;
      
      private var lfmetaCarpal04:Cube;
      
      private var rtFingerPinky02:Cube;
      
      private var rtFingerPinky03:Cube;
      
      private var starting:Boolean = true;
      
      private var shiftDown:Boolean;
      
      private var rtFingerPinky01:Cube;
      
      public var btnResetAll:Button;
      
      private var rtFingerRing01:Cube;
      
      private var rtFingerRing02:Cube;
      
      private var ROTlfHip:DisplayObject3D;
      
      private var rtFingerRing03:Cube;
      
      private var LookAtNode:DisplayObject3D;
      
      public var keyframeBox:TextArea;
      
      private var lfThumb01d:Cube;
      
      private var scene:Scene3D;
      
      private var LeftEye:Cube;
      
      private var pose:Matrix3D;
      
      private var viewport:Viewport3D;
      
      private var defaultXAF:String;
      
      private var ROTlfFingerMiddle01:DisplayObject3D;
      
      private var flatShaderMat3:FlatShadeMaterial;
      
      private var ROTlfFingerMiddle02:DisplayObject3D;
      
      private var ROTlfFingerMiddle03:DisplayObject3D;
      
      private var ROTlfFingerIndex02:DisplayObject3D;
      
      private var ROTlfFingerIndex03:DisplayObject3D;
      
      private var ROTlfFingerIndex01:DisplayObject3D;
      
      private var renderer:BasicRenderEngine;
      
      private var TextUp:Boolean;
      
      private var ROTrtClavicle:DisplayObject3D;
      
      private var MyRoot:DisplayObject3D;
      
      private var ROTlfElbow:DisplayObject3D;
      
      private var isMouseDown:Boolean;
      
      private var ROTlfWrist:DisplayObject3D;
      
      public var __id4_:Button;
      
      public var i2:int;
      
      private var rtmetaCarpal01:Cube;
      
      private var rtmetaCarpal03:Cube;
      
      private var rtmetaCarpal05:Cube;
      
      private var rtmetaCarpal02:Cube;
      
      private var ROTrtFingerIndex01:DisplayObject3D;
      
      private var lfFingerMiddle01:Cube;
      
      private var gizmoNow:String;
      
      private var lfFingerMiddle02:Cube;
      
      private var lfFingerMiddle03:Cube;
      
      public var __id5_:TextArea;
      
      public var j2:*;
      
      private var lfHand:Cube;
      
      private var ROTlfFingerRing01:DisplayObject3D;
      
      private var ROTlfFingerRing03:DisplayObject3D;
      
      private var ROTrtElbow:DisplayObject3D;
      
      private var lfToes:Cube;
      
      private var ROTrtFingerIndex02:DisplayObject3D;
      
      private var ROTrtFingerIndex03:DisplayObject3D;
      
      private var lfFoot:Cube;
      
      private var ROTlfFingerRing02:DisplayObject3D;
      
      private var rtmetaCarpal04:Cube;
      
      public var __id6_:TextArea;
      
      private var ROTlfThigh:DisplayObject3D;
      
      private var ROTrtWrist:DisplayObject3D;
      
      private var lfShoulder:Cube;
      
      public var __id7_:Label;
      
      private var MAPBall:DisplayObject3D;
      
      private var ROTrtThigh:DisplayObject3D;
      
      private var m2:MaterialsList;
      
      private var pointLight:PointLight3D;
      
      private var ROTlfFingerPinky01:DisplayObject3D;
      
      private var ROTlfFingerPinky02:DisplayObject3D;
      
      private var ROTlfFingerPinky03:DisplayObject3D;
      
      private var m3:MaterialsList;
      
      private var PelvisNode:Cube;
      
      private var ROTlfToes:DisplayObject3D;
      
      private var lfbicep:Cube;
      
      private var ROTlfThumb01d:DisplayObject3D;
      
      private var ROTlfFoot:DisplayObject3D;
      
      private var Spine02:Cube;
      
      private var Spine04:Cube;
      
      private var Spine01:Cube;
      
      public var btnResetView:Button;
      
      private var rtBicep:Cube;
      
      private var Spine03:Cube;
      
      private var ROTlfmetaCarpal02:DisplayObject3D;
      
      private var ROTlfmetaCarpal03:DisplayObject3D;
      
      private var ROTlfmetaCarpal04:DisplayObject3D;
      
      private var ROTlfmetaCarpal05:DisplayObject3D;
      
      private var ROTlfmetaCarpal01:DisplayObject3D;
      
      private var Ground:Plane;
      
      private var ROTrtFingerPinky01:DisplayObject3D;
      
      private var colorMaterial:ColorMaterial;
      
      private var ROTlfHand:DisplayObject3D;
      
      private var recallSelectedBone:DisplayObject3D;
      
      public var collProp2:Object;
      
      private var ROTrtFingerPinky03:DisplayObject3D;
      
      private var rtThumb01:Cube;
      
      private var rtThumb02:Cube;
      
      public var btnResetBone:Button;
      
      private var ROTrtFingerPinky02:DisplayObject3D;
      
      private var rtThumb03:Cube;
      
      private var trackball:Sphere;
      
      private var rtFoot:Cube;
      
      private var rtHand:Cube;
      
      private var ROTrtFingerRing01:DisplayObject3D;
      
      private var ROTrtFingerRing02:DisplayObject3D;
      
      private var ROTrtFingerRing03:DisplayObject3D;
      
      private var rtToes:Cube;
      
      private var ROTrtThumb02:DisplayObject3D;
      
      private var q1:Quaternion;
      
      private var ROTrtThumb01:DisplayObject3D;
      
      private var ROTrtThumb03:DisplayObject3D;
      
      private var rtHip:Cube;
      
      public var myDropDown:ComboBox;
      
      private var Head:Sphere;
      
      private var rtShoulder:Cube;
      
      private var ROTGround:DisplayObject3D;
      
      private var ring:Cylinder;
      
      public var controlPlay:Button;
      
      private var ROTlfShoulder:DisplayObject3D;
      
      private var ROTrtToes:DisplayObject3D;
      
      private var ROTrtHand:DisplayObject3D;
      
      private var ROTrtFoot:DisplayObject3D;
      
      private var slerpTime:Number;
      
      private var ROTPelvisNode:DisplayObject3D;
      
      private var ROTrtmetaCarpal02:DisplayObject3D;
      
      private var ROTrtmetaCarpal03:DisplayObject3D;
      
      private var lfElbow:Cube;
      
      private var ROTrtmetaCarpal05:DisplayObject3D;
      
      private var ROTrtmetaCarpal01:DisplayObject3D;
      
      private var ROTrtmetaCarpal04:DisplayObject3D;
      
      private var lfWrist:Cube;
      
      private var tx:Number;
      
      private var ty:Number;
      
      private var tz:Number;
      
      private var RightEye:Cube;
      
      private var ROTrtHip:DisplayObject3D;
      
      public var durationStepper:NumericStepper;
      
      private var cube3:Cube;
      
      private var rtElbow:Cube;
      
      private var showThingy:Boolean;
      
      private var cube2:Cube;
      
      private var rtWrist:Cube;
      
      private var Neck02:Cube;
      
      private var frmNo:*;
      
      private var lfThigh:Cube;
      
      public var copyDropDown:ComboBox;
      
      public var btnThingy:Button;
      
      private var Neck03:Cube;
      
      public var collProps2:Array;
      
      private var Neck01:Cube;
      
      private var Neck04:Cube;
      
      private var jointType:Array;
      
      private var lfCalf:Cube;
      
      private var ROTrtShoulder:DisplayObject3D;
      
      public var controlStop:Button;
      
      private var lfClavicle:Cube;
      
      private var rtThigh:Cube;
      
      private var camera:Camera3D;
      
      public var collObj2:DataProvider;
      
      private var boneNumber:Array;
      
      public var btnBoneZoom:Button;
      
      private var RingDown:Boolean;
      
      private var myDelay:Number;
      
      private var ROTNeck02:DisplayObject3D;
      
      private var slerpDelay:Number;
      
      private var ROTNeck04:DisplayObject3D;
      
      private var ROTNeck01:DisplayObject3D;
      
      private var ROTNeck03:DisplayObject3D;
      
      private var trashAll:Boolean;
      
      private var lfFingerIndex03:Cube;
      
      private var lfFingerIndex01:Cube;
      
      private var lfFingerIndex02:Cube;
      
      private var ROTlfCalf:DisplayObject3D;
      
      private var mousePos:Point;
      
      private var ROTrtFingerMiddle01:DisplayObject3D;
      
      private var ROTrtFingerMiddle02:DisplayObject3D;
      
      private var lfThumb02:Cube;
      
      private var lfThumb03:Cube;
      
      private var gizmo:DisplayObject3D;
      
      private var IMVUBall:DisplayObject3D;
      
      public var caret:Symbol1;
      
      public var GetXAF:Button;
      
      private var rtFingerIndex03:Cube;
      
      public var BoneName:Label;
      
      private var rtFingerIndex02:Cube;
      
      private var ROTrtFingerMiddle03:DisplayObject3D;
      
      private var lfFingerRing02:Cube;
      
      private var rtFingerIndex01:Cube;
      
      private var lfFingerRing01:Cube;
      
      private var lfFingerRing03:Cube;
      
      private var controlDown:Boolean;
      
      private var ROTlfThumb02:DisplayObject3D;
      
      private var ROTlfThumb03:DisplayObject3D;
      
      private var lfHip:Cube;
      
      public var LoadXAF:Button;
      
      private var rtCalf:Cube;
      
      public var btnHelp:Button;
      
      private var rtFingerMiddle01:Cube;
      
      private var flatShaderMat:FlatShadeMaterial;
      
      private var rtFingerMiddle03:Cube;
      
      private var rtFingerMiddle02:Cube;
      
      public var itemObj2:SimpleCollectionItem;
      
      private var originalQuaternion:Array;
      
      private var matSphereComposite:CompositeMaterial;
      
      private var rtClavicle:Cube;
      
      private var ROTlfbicep:DisplayObject3D;
      
      private var ROTSpine01:DisplayObject3D;
      
      private var ROTSpine02:DisplayObject3D;
      
      private var ROTSpine03:DisplayObject3D;
      
      private var ROTSpine04:DisplayObject3D;
      
      private var ROTrtBicep:DisplayObject3D;
      
      private var selectedBone:DisplayObject3D;
      
      public function PV3DInteractive()
      {
         var lastFrame:* = undefined;
         var keyframeArray:Array = null;
         var bitmapAssetMat:BitmapAssetMaterial = null;
         var colorMat:ColorMaterial = null;
         var wireMat:WireframeMaterial = null;
         var comMat:CompositeMaterial = null;
         var ml:MaterialsList = null;
         var sphMat:MaterialObject3D = null;
         var aTa:* = undefined;
         var tooltip:* = undefined;
         var kf:Array = null;
         var b:* = undefined;
         var FlyBtnClose:* = undefined;
         var FlyBtnLoad:* = undefined;
         var FlyBtnYes:* = undefined;
         var FlyBtnNo:* = undefined;
         var L_MyRoot:* = undefined;
         var L_PelvisNode:* = undefined;
         var L_lfHip:* = undefined;
         var L_lfThigh:* = undefined;
         var L_lfCalf:* = undefined;
         var L_lfFoot:* = undefined;
         var L_lfToes:* = undefined;
         var L_rtHip:* = undefined;
         var L_rtThigh:* = undefined;
         var L_rtCalf:* = undefined;
         var L_rtFoot:* = undefined;
         var L_rtToes:* = undefined;
         var L_Spine01:* = undefined;
         var L_Spine02:* = undefined;
         var L_Spine03:* = undefined;
         var L_Spine04:* = undefined;
         var L_Neck01:* = undefined;
         var L_Neck02:* = undefined;
         var L_Neck03:* = undefined;
         var L_Neck04:* = undefined;
         var L_Head:* = undefined;
         var L_lfClavicle:* = undefined;
         var L_lfShoulder:* = undefined;
         var L_lfbicep:* = undefined;
         var L_lfElbow:* = undefined;
         var L_lfWrist:* = undefined;
         var L_lfHand:* = undefined;
         var L_lfmetaCarpal03:* = undefined;
         var L_lfFingerMiddle01:* = undefined;
         var L_lfFingerMiddle02:* = undefined;
         var L_lfFingerMiddle03:* = undefined;
         var L_lfmetaCarpal01:* = undefined;
         var L_lfThumb01d:* = undefined;
         var L_lfThumb02:* = undefined;
         var L_lfThumb03:* = undefined;
         var L_lfmetaCarpal05:* = undefined;
         var L_lfFingerPinky01:* = undefined;
         var L_lfFingerPinky02:* = undefined;
         var L_lfFingerPinky03:* = undefined;
         var L_lfmetaCarpal02:* = undefined;
         var L_lfFingerIndex01:* = undefined;
         var L_lfFingerIndex02:* = undefined;
         var L_lfFingerIndex03:* = undefined;
         var L_lfmetaCarpal04:* = undefined;
         var L_lfFingerRing01:* = undefined;
         var L_lfFingerRing02:* = undefined;
         var L_lfFingerRing03:* = undefined;
         var L_rtClavicle:* = undefined;
         var L_rtShoulder:* = undefined;
         var L_rtBicep:* = undefined;
         var L_rtElbow:* = undefined;
         var L_rtWrist:* = undefined;
         var L_rtHand:* = undefined;
         var L_rtmetaCarpal03:* = undefined;
         var L_rtFingerMiddle01:* = undefined;
         var L_rtFingerMiddle02:* = undefined;
         var L_rtFingerMiddle03:* = undefined;
         var L_rtmetaCarpal01:* = undefined;
         var L_rtThumb01:* = undefined;
         var L_rtThumb02:* = undefined;
         var L_rtThumb03:* = undefined;
         var L_rtmetaCarpal05:* = undefined;
         var L_rtFingerPinky01:* = undefined;
         var L_rtFingerPinky02:* = undefined;
         var L_rtFingerPinky03:* = undefined;
         var L_rtmetaCarpal02:* = undefined;
         var L_rtFingerIndex01:* = undefined;
         var L_rtFingerIndex02:* = undefined;
         var L_rtFingerIndex03:* = undefined;
         var L_rtmetaCarpal04:* = undefined;
         var L_rtFingerRing01:* = undefined;
         var L_rtFingerRing02:* = undefined;
         var L_rtFingerRing03:* = undefined;
         var defaultXAF:* = undefined;
         var matYellow:* = undefined;
         var matPink:* = undefined;
         var matPurple:* = undefined;
         var myLabels:Array = null;
         var i:* = undefined;
         var resultColorTransform:ColorTransform = null;
         var originalColorTransform:* = undefined;
         var StartBtn:* = undefined;
         var thingyToggle:Function = null;
         var setThingy:Function = null;
         var doGizmoRelease:Function = null;
         var doGizmoX:Function = null;
         var doGizmoY:Function = null;
         var doGizmoZ:Function = null;
         var doGizmo:Function = null;
         var wereOn:Function = null;
         var doFlyBtnYes:Function = null;
         var doFlyBtnNo:Function = null;
         var doFlyBtnYesNo:Function = null;
         var doControlStop:Function = null;
         var doControlPlay:Function = null;
         var doPlayFloor:Function = null;
         var doPlay:Function = null;
         var text2Quat:Function = null;
         var tooltipMouseClick:Function = null;
         var doCopyDropDown:Function = null;
         var tooltipMouseOver:Function = null;
         var tooltipMouseOut:Function = null;
         var doResetAll:Function = null;
         var doBtnHelp:Function = null;
         var doBtnResetView_B:Function = null;
         var doBtnResetView_R:Function = null;
         var doBtnResetView_L:Function = null;
         var doBtnResetView_A:Function = null;
         var doBtnResetView_U:Function = null;
         var doBtnResetView:Function = null;
         var doLoadXAF:Function = null;
         var closeXAF:Function = null;
         var LOADparseXAF:Function = null;
         var wipe:Function = null;
         var parseXAF:Function = null;
         var doBtnResetBone:Function = null;
         var TRANByBone:Function = null;
         var ROTByBone:Function = null;
         var doSlerp:Function = null;
         var sixDig:Function = null;
         var PV2IMVU:Function = null;
         var checkKeysDown:Function = null;
         var checkKeysUp:Function = null;
         var onPress:Function = null;
         var makeXAF:Function = null;
         var doGetXAF:Function = null;
         var getKf:Function = null;
         var onStageMouseDown:Function = null;
         var onStageMouseUp:Function = null;
         var onBone:Function = null;
         var Move:Function = null;
         var onEnterFrame:Function = null;
         starting = true;
         boneNumber = [];
         originalQuaternion = [];
         jointType = [];
         super();
         thingyToggle = function():*
         {
            showThingy = !showThingy;
            setThingy();
         };
         setThingy = function():*
         {
            switch(myDropDown.selectedLabel)
            {
               case "Ball & socket":
                  gizmoX.visible = true;
                  gizmoY.visible = true;
                  gizmoZ.visible = true;
                  break;
               case "Pivot":
                  gizmoX.visible = true;
                  gizmoY.visible = false;
                  gizmoZ.visible = false;
                  break;
               case "Hinge Y":
                  gizmoX.visible = false;
                  gizmoY.visible = true;
                  gizmoZ.visible = false;
                  break;
               case "Hinge Z":
                  gizmoX.visible = false;
                  gizmoY.visible = false;
                  gizmoZ.visible = true;
                  break;
               case "Saddle":
                  gizmoX.visible = false;
                  gizmoY.visible = true;
                  gizmoZ.visible = true;
                  break;
               case "Fixed":
                  gizmoX.visible = false;
                  gizmoY.visible = false;
                  gizmoZ.visible = false;
            }
            if(!showThingy)
            {
               gizmoX.visible = false;
               gizmoY.visible = false;
               gizmoZ.visible = false;
            }
         };
         doGizmoRelease = function():*
         {
            gizmoNow = "";
         };
         doGizmoX = function():*
         {
            doGizmo("X");
         };
         doGizmoY = function():*
         {
            doGizmo("Y");
         };
         doGizmoZ = function():*
         {
            doGizmo("Z");
         };
         doGizmo = function(param1:*):*
         {
            gizmoNow = param1;
            selectedBone = recallSelectedBone;
            Move(selectedBone);
         };
         wereOn = function():*
         {
            var _loc1_:* = undefined;
            doFlyBtnYesNo(true);
            aTa.htmlText = "";
            aTa.visible = false;
            StartBtn.visible = false;
            _loc1_ = new Quaternion(0,0,-0.707,-0.707);
            gizmoX.transform.copy3x3(_loc1_.matrix);
            _loc1_ = new Quaternion(0,-0.707,0,-0.707);
            gizmoY.transform.copy3x3(_loc1_.matrix);
            _loc1_ = new Quaternion(-0.707,0,0,-0.707);
            gizmoZ.transform.copy3x3(_loc1_.matrix);
            gizmoX.visible = false;
            gizmoY.visible = false;
            gizmoZ.visible = false;
         };
         doFlyBtnYes = function():*
         {
            doFlyBtnYesNo(true);
         };
         doFlyBtnNo = function():*
         {
            doFlyBtnYesNo(false);
         };
         doFlyBtnYesNo = function(param1:*):*
         {
            var _loc2_:MouseEvent = null;
            FlyBtnYes.visible = false;
            FlyBtnNo.visible = false;
            aTa.visible = false;
            if(param1)
            {
               if(trashAll)
               {
                  wipe();
               }
               else if(Number(keyframeBox.text) == 0)
               {
                  keyframeArray[0] = defaultXAF;
                  aTa.text = defaultXAF;
                  doBtnResetView();
                  ROTByBone(ROTGround,"-0.707 0 0 -0.707");
                  parseXAF(false);
               }
               else
               {
                  keyframeArray[Number(keyframeBox.text)] = "";
                  _loc2_ = new MouseEvent(MouseEvent.CLICK);
                  kf[Number(keyframeBox.text)].dispatchEvent(_loc2_);
                  kf[Number(keyframeBox.text)].transform.colorTransform = originalColorTransform;
                  kf[Number(keyframeBox.text)].emphasized = false;
               }
            }
         };
         doControlStop = function():*
         {
            var _loc1_:* = undefined;
            var _loc2_:MouseEvent = null;
            Tweener.removeAllTweens();
            _loc1_ = (caret.x - 5) / 3;
            _loc1_ = Math.ceil(_loc1_ - 0.5);
            _loc2_ = new MouseEvent(MouseEvent.CLICK);
            kf[_loc1_].dispatchEvent(_loc2_);
         };
         doControlPlay = function():*
         {
            var quickFloor:* = undefined;
            var myTArray:* = undefined;
            var oriQ:* = undefined;
            var tarQ:* = undefined;
            var xmlData:* = undefined;
            var xmlArray:* = undefined;
            var xmlFrameTime:* = undefined;
            var j:* = undefined;
            var Sdelay:* = undefined;
            var Stime:* = undefined;
            Tweener.removeAllTweens();
            quickFloor = XML("<xaf>" + keyframeArray[0] + "</xaf>").ANIMATION.TRACK.(@BONEID == 1).KEYFRAME[0].TRANSLATION;
            myTArray = quickFloor.split(" ");
            ROTGround.x = -Number(myTArray[0]);
            ROTGround.y = -80 - Number(myTArray[2]);
            ROTGround.z = -Number(myTArray[1]);
            xmlArray = new Array();
            xmlFrameTime = new Array();
            caret.x = 5;
            Tweener.addTween(caret,{
               "x":565,
               "delay":0.1,
               "transition":"linear",
               "time":durationStepper.value
            });
            Tweener.pauseAllTweens();
            i = 0;
            while(i <= lastFrame)
            {
               if(keyframeArray[i] != "")
               {
                  xmlData = new XML("<xaf>" + keyframeArray[i] + "</xaf>");
                  xmlArray.push(xmlData);
                  xmlFrameTime.push(durationStepper.value * i / lastFrame);
               }
               ++i;
            }
            j = 0;
            Sdelay = 0.1;
            i = 0;
            while(i < xmlArray.length - 2)
            {
               j = i + 1;
               Stime = xmlFrameTime[j] - xmlFrameTime[i];
               doPlay(ROTPelvisNode,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTPelvisNode"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTPelvisNode"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfHip,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfHip"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfHip"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfThigh,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfThigh"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfThigh"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfCalf,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfCalf"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfCalf"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfFoot,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFoot"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFoot"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfToes,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfToes"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfToes"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtHip,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtHip"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtHip"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtThigh,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtThigh"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtThigh"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtCalf,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtCalf"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtCalf"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtFoot,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFoot"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFoot"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtToes,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtToes"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtToes"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTSpine01,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTSpine01"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTSpine01"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTSpine02,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTSpine02"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTSpine02"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTSpine03,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTSpine03"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTSpine03"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTSpine04,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTSpine04"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTSpine04"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTNeck01,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTNeck01"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTNeck01"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTNeck02,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTNeck02"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTNeck02"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTNeck03,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTNeck03"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTNeck03"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTNeck04,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTNeck04"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTNeck04"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTHead,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTHead"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTHead"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfClavicle,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfClavicle"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfClavicle"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfShoulder,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfShoulder"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfShoulder"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfbicep,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfbicep"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfbicep"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfElbow,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfElbow"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfElbow"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfWrist,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfWrist"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfWrist"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfHand,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfHand"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfHand"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfmetaCarpal03,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfmetaCarpal03"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfmetaCarpal03"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfFingerMiddle01,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerMiddle01"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerMiddle01"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfFingerMiddle02,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerMiddle02"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerMiddle02"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfFingerMiddle03,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerMiddle03"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerMiddle03"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfmetaCarpal01,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfmetaCarpal01"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfmetaCarpal01"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfThumb01d,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfThumb01d"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfThumb01d"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfThumb02,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfThumb02"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfThumb02"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfThumb03,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfThumb03"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfThumb03"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfmetaCarpal05,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfmetaCarpal05"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfmetaCarpal05"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfFingerPinky01,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerPinky01"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerPinky01"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfFingerPinky02,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerPinky02"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerPinky02"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfFingerPinky03,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerPinky03"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerPinky03"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfmetaCarpal02,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfmetaCarpal02"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfmetaCarpal02"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfFingerIndex01,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerIndex01"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerIndex01"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfFingerIndex02,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerIndex02"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerIndex02"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfFingerIndex03,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerIndex03"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerIndex03"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfmetaCarpal04,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfmetaCarpal04"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfmetaCarpal04"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfFingerRing01,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerRing01"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerRing01"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfFingerRing02,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerRing02"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerRing02"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTlfFingerRing03,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerRing03"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerRing03"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtClavicle,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtClavicle"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtClavicle"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtShoulder,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtShoulder"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtShoulder"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtBicep,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtBicep"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtBicep"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtElbow,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtElbow"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtElbow"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtWrist,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtWrist"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtWrist"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtHand,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtHand"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtHand"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtmetaCarpal03,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtmetaCarpal03"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtmetaCarpal03"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtFingerMiddle01,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerMiddle01"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerMiddle01"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtFingerMiddle02,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerMiddle02"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerMiddle02"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtFingerMiddle03,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerMiddle03"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerMiddle03"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtmetaCarpal01,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtmetaCarpal01"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtmetaCarpal01"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtThumb01,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtThumb01"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtThumb01"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtThumb02,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtThumb02"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtThumb02"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtThumb03,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtThumb03"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtThumb03"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtmetaCarpal05,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtmetaCarpal05"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtmetaCarpal05"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtFingerPinky01,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerPinky01"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerPinky01"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtFingerPinky02,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerPinky02"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerPinky02"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtFingerPinky03,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerPinky03"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerPinky03"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtmetaCarpal02,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtmetaCarpal02"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtmetaCarpal02"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtFingerIndex01,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerIndex01"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerIndex01"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtFingerIndex02,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerIndex02"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerIndex02"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtFingerIndex03,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerIndex03"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerIndex03"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtmetaCarpal04,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtmetaCarpal04"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtmetaCarpal04"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtFingerRing01,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerRing01"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerRing01"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtFingerRing02,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerRing02"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerRing02"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlay(ROTrtFingerRing03,xmlArray[i].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerRing03"]).KEYFRAME[0].ROTATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerRing03"]).KEYFRAME[0].ROTATION,Sdelay,Stime);
               doPlayFloor(xmlArray[i].ANIMATION.TRACK.(@BONEID == 1).KEYFRAME[0].TRANSLATION,xmlArray[j].ANIMATION.TRACK.(@BONEID == 1).KEYFRAME[0].TRANSLATION,Sdelay,Stime);
               Sdelay += Stime;
               ++i;
            }
            Tweener.updateTime();
            Tweener.resumeAllTweens();
         };
         doPlayFloor = function(param1:*, param2:*, param3:*, param4:*):*
         {
            var _loc5_:* = undefined;
            _loc5_ = param2.split(" ");
            Tweener.addTween(ROTGround,{
               "x":-Number(_loc5_[0]),
               "y":-80 - Number(_loc5_[2]),
               "z":-Number(_loc5_[1]),
               "transition":"linear",
               "time":param4,
               "delay":param3
            });
            Tweener.pauseAllTweens();
         };
         doPlay = function(param1:*, param2:*, param3:*, param4:*, param5:*):*
         {
            var voQ:* = undefined;
            var vtQ:* = undefined;
            var extraObject:Object = null;
            var bone:* = param1;
            var oQ:* = param2;
            var tQ:* = param3;
            var Pdelay:* = param4;
            var Ptime:* = param5;
            voQ = text2Quat(oQ);
            vtQ = text2Quat(tQ);
            extraObject = {};
            extraObject.slerp = 0;
            bone.extra = extraObject;
            Tweener.addTween(bone.extra,{
               "slerp":1,
               "transition":"linear",
               "time":Ptime,
               "delay":Pdelay,
               "onUpdate":function():*
               {
                  bone.transform.copy3x3(Quaternion.slerp(voQ,vtQ,this.slerp).matrix);
               }
            });
            Tweener.pauseAllTweens();
         };
         text2Quat = function(param1:*):*
         {
            var _loc2_:* = undefined;
            var _loc3_:* = undefined;
            _loc2_ = param1.split(" ");
            return new Quaternion(_loc2_[0],_loc2_[2],_loc2_[1],_loc2_[3]);
         };
         tooltipMouseClick = function(param1:MouseEvent):*
         {
            var myButton:* = undefined;
            var thisPose:* = undefined;
            var myl:* = undefined;
            var prevFrame:* = undefined;
            var nextFrame:* = undefined;
            var slerpDegree:* = undefined;
            var PREVxmlData:* = undefined;
            var NEXTxmlData:* = undefined;
            var prevFloor:* = undefined;
            var nextFloor:* = undefined;
            var a:* = undefined;
            var b:* = undefined;
            var c:* = undefined;
            var prevQuat:* = undefined;
            var nextQuat:* = undefined;
            var prevArray:* = undefined;
            var nextArray:* = undefined;
            var pQ:* = undefined;
            var nQ:* = undefined;
            var rQ:* = undefined;
            var tempTB:* = undefined;
            var event:MouseEvent = param1;
            myButton = event.target;
            kfNum = Number(myButton.label);
            keyframeBox.text = kfNum;
            caret.x = myButton.x + 1.5;
            thisPose = keyframeArray[kfNum];
            if(thisPose != "")
            {
               aTa.text = thisPose;
               parseXAF(false);
            }
            else
            {
               i = kfNum;
               while(i >= 0)
               {
                  if(keyframeArray[i] != "")
                  {
                     prevFrame = i;
                     break;
                  }
                  --i;
               }
               i = kfNum;
               while(i < lastFrame)
               {
                  if(keyframeArray[i] != "")
                  {
                     nextFrame = i;
                     break;
                  }
                  ++i;
               }
               if(nextFrame == undefined)
               {
                  nextFrame = prevFrame;
                  slerpDegree = 1;
               }
               else
               {
                  slerpDegree = (kfNum - prevFrame) / (nextFrame - prevFrame);
               }
               PREVxmlData = new XML("<xaf>" + keyframeArray[prevFrame] + "</xaf>");
               NEXTxmlData = new XML("<xaf>" + keyframeArray[nextFrame] + "</xaf>");
               i = 1;
               while(i <= 84)
               {
                  if(i == 7)
                  {
                     i = 8;
                  }
                  if(i == 13)
                  {
                     i = 14;
                  }
                  if(i == 23)
                  {
                     i = 24;
                  }
                  if(i == 34)
                  {
                     i = 35;
                  }
                  if(i == 39)
                  {
                     i = 40;
                  }
                  if(i == 44)
                  {
                     i = 45;
                  }
                  if(i == 49)
                  {
                     i = 50;
                  }
                  if(i == 54)
                  {
                     i = 55;
                  }
                  if(i == 65)
                  {
                     i = 66;
                  }
                  if(i == 70)
                  {
                     i = 71;
                  }
                  if(i == 75)
                  {
                     i = 76;
                  }
                  if(i == 80)
                  {
                     i = 81;
                  }
                  prevQuat = PREVxmlData.ANIMATION.TRACK.(@BONEID == i).KEYFRAME[0].ROTATION;
                  nextQuat = NEXTxmlData.ANIMATION.TRACK.(@BONEID == i).KEYFRAME[0].ROTATION;
                  prevArray = prevQuat.split(" ");
                  nextArray = nextQuat.split(" ");
                  pQ = new Quaternion(prevArray[0],prevArray[2],prevArray[1],prevArray[3]);
                  nQ = new Quaternion(nextArray[0],nextArray[2],nextArray[1],nextArray[3]);
                  rQ = Quaternion.slerp(pQ,nQ,slerpDegree);
                  tempTB = trackball.transform;
                  trackball.transform = rQ.matrix;
                  PREVxmlData.ANIMATION.TRACK.(@BONEID == i).KEYFRAME[0].ROTATION = PV2IMVU(trackball);
                  trackball.transform = tempTB;
                  ++i;
               }
               prevFloor = PREVxmlData.ANIMATION.TRACK.(@BONEID == "1").KEYFRAME[0].TRANSLATION;
               nextFloor = NEXTxmlData.ANIMATION.TRACK.(@BONEID == "1").KEYFRAME[0].TRANSLATION;
               prevArray = prevFloor.split(" ");
               nextArray = nextFloor.split(" ");
               a = (Number(nextArray[0]) - Number(prevArray[0])) * slerpDegree + Number(prevArray[0]);
               b = (Number(nextArray[1]) - Number(prevArray[1])) * slerpDegree + Number(prevArray[1]);
               c = (Number(nextArray[2]) - Number(prevArray[2])) * slerpDegree + Number(prevArray[2]);
               PREVxmlData.ANIMATION.TRACK.(@BONEID == "1").KEYFRAME[0].TRANSLATION = a + " " + b + " " + c;
               aTa.text = PREVxmlData;
               parseXAF(true);
            }
            copyDropDown.removeAll();
            i = 0;
            while(i < lastFrame)
            {
               if(keyframeArray[i] != "" && i != kfNum)
               {
                  copyDropDown.addItem({
                     "label":i,
                     "data":[i]
                  });
               }
               ++i;
            }
            myl = copyDropDown.length;
            if(myl > 24)
            {
               myl = 24;
            }
            copyDropDown.rowCount = myl;
         };
         doCopyDropDown = function():*
         {
            var _loc1_:MouseEvent = null;
            keyframeArray[kfNum] = keyframeArray[copyDropDown.selectedLabel];
            _loc1_ = new MouseEvent(MouseEvent.CLICK);
            kf[kfNum].dispatchEvent(_loc1_);
            kf[kfNum].transform.colorTransform = resultColorTransform;
            kf[kfNum].emphasized = true;
         };
         tooltipMouseOver = function(param1:MouseEvent):*
         {
            var _loc2_:* = undefined;
            _loc2_ = param1.target;
            tooltip.x = _loc2_.x - 5 - Number(_loc2_.label) / 18;
            tooltip.text = _loc2_.label;
         };
         tooltipMouseOut = function(param1:MouseEvent):*
         {
            tooltip.text = "";
         };
         doResetAll = function():void
         {
            FlyBtnYes.visible = true;
            FlyBtnNo.visible = true;
            aTa.x = 185;
            aTa.y = 235;
            aTa.width = 200;
            aTa.height = 25;
            if(shiftDown)
            {
               trashAll = true;
               aTa.text = "Do you really want to start over?";
            }
            else
            {
               trashAll = false;
               aTa.text = "Do you really want to trash this frame?";
            }
            aTa.visible = true;
         };
         doBtnHelp = function():*
         {
            var url:String = null;
            var request:URLRequest = null;
            url = "http://www.imvu.com/catalog/modules.php?op=modload&name=phpbb2&file=viewtopic.php&t=251970";
            request = new URLRequest(url);
            try
            {
               navigateToURL(request,"_blank");
            }
            catch(e:Error)
            {
               trace("Error occurred!");
            }
         };
         doBtnResetView_B = function():*
         {
            ROTByBone(MyRoot,"0 0 -1 0");
            ROTByBone(trackball,"0 0 -1 0");
            selectedBone = MyRoot;
            recallSelectedBone = MyRoot;
            pose = trackball.transform;
            Tweener.addTween(camera,{
               "x":0,
               "y":0,
               "z":-1095,
               "transition":"easeInOutCirc",
               "time":0.4
            });
         };
         doBtnResetView_R = function():*
         {
            ROTByBone(MyRoot,"0 0 0.707 -0.707");
            ROTByBone(trackball,"0 0 0.707 -0.707");
            selectedBone = MyRoot;
            recallSelectedBone = MyRoot;
            pose = trackball.transform;
            Tweener.addTween(camera,{
               "x":0,
               "y":0,
               "z":-1095,
               "transition":"easeInOutCirc",
               "time":0.4
            });
         };
         doBtnResetView_L = function():*
         {
            ROTByBone(MyRoot,"0 0 -0.707 -0.707");
            ROTByBone(trackball,"0 0 -0.707 -0.707");
            selectedBone = MyRoot;
            recallSelectedBone = MyRoot;
            pose = trackball.transform;
            Tweener.addTween(camera,{
               "x":0,
               "y":0,
               "z":-1095,
               "transition":"easeInOutCirc",
               "time":0.4
            });
         };
         doBtnResetView_A = function():*
         {
            ROTByBone(MyRoot,"0.707 0 0 -0.707");
            ROTByBone(trackball,"0.707 0 0 -0.707");
            selectedBone = MyRoot;
            recallSelectedBone = MyRoot;
            pose = trackball.transform;
            Tweener.addTween(camera,{
               "x":0,
               "y":0,
               "z":-1095,
               "transition":"easeInOutCirc",
               "time":0.4
            });
         };
         doBtnResetView_U = function():*
         {
            ROTByBone(MyRoot,"-0.707 0 0 -0.707");
            ROTByBone(trackball,"-0.707 0 0 -0.707");
            selectedBone = MyRoot;
            recallSelectedBone = MyRoot;
            pose = trackball.transform;
            Tweener.addTween(camera,{
               "x":0,
               "y":0,
               "z":-1095,
               "transition":"easeInOutCirc",
               "time":0.4
            });
         };
         doBtnResetView = function():*
         {
            ROTByBone(MyRoot,"0 0 0 1");
            ROTByBone(trackball,"0 0 0 1");
            selectedBone = MyRoot;
            recallSelectedBone = MyRoot;
            pose = trackball.transform;
            Tweener.addTween(camera,{
               "x":0,
               "y":0,
               "z":-1095,
               "transition":"easeInOutCirc",
               "time":0.4
            });
         };
         doLoadXAF = function():*
         {
            FlyBtnClose.visible = true;
            FlyBtnLoad.visible = true;
            aTa.x = 50;
            aTa.y = 50;
            aTa.width = 456;
            aTa.height = 400;
            aTa.visible = true;
         };
         closeXAF = function():*
         {
            aTa.visible = false;
            aTa.text = "";
            FlyBtnClose.visible = false;
            FlyBtnLoad.visible = false;
         };
         LOADparseXAF = function():*
         {
            var myXAF:* = undefined;
            var xmlData:* = undefined;
            var NUMKEYFRAMES:* = undefined;
            var DURATION:* = undefined;
            var oneFrameXML:* = undefined;
            var tracks:* = undefined;
            var myTime:* = undefined;
            var fractionOfWhole:* = undefined;
            var whichFrame:* = undefined;
            var element:* = undefined;
            myXAF = aTa.text;
            xmlData = new XML("<xaf>" + myXAF + "</xaf>");
            NUMKEYFRAMES = xmlData.ANIMATION.TRACK.(@BONEID == "1").KEYFRAME.length();
            DURATION = xmlData.ANIMATION.attribute("DURATION");
            if(NUMKEYFRAMES == 1)
            {
               if(kfNum == undefined)
               {
                  kfNum = 0;
               }
               keyframeArray[kfNum] = aTa.text;
               parseXAF(false);
               kf[kfNum].transform.colorTransform = resultColorTransform;
               kf[kfNum].emphasized = true;
               if(kfNum == 0)
               {
                  durationStepper.value = DURATION;
               }
            }
            else
            {
               wipe();
               i = 0;
               while(i < NUMKEYFRAMES)
               {
                  oneFrameXML = "";
                  tracks = 0;
                  while(tracks <= 86)
                  {
                     element = xmlData.ANIMATION.TRACK.(@BONEID == tracks).KEYFRAME[i];
                     if(element != undefined)
                     {
                        oneFrameXML = oneFrameXML + "<TRACK BONEID=\"" + tracks + "\">\n" + element + "\n</TRACK>\n";
                     }
                     tracks++;
                  }
                  oneFrameXML = "<HEADER MAGIC=\"XAF\" VERSION=\"919\" />\n<ANIMATION NUMTRACKS=\"72\" DURATION=\"10\">\n" + oneFrameXML + "</ANIMATION>";
                  myTime = xmlData.ANIMATION.TRACK.(@BONEID == "1").KEYFRAME[i].attribute("TIME");
                  fractionOfWhole = myTime / DURATION;
                  whichFrame = Math.ceil(fractionOfWhole * (lastFrame - 1) - 0.5);
                  keyframeArray[whichFrame] = oneFrameXML;
                  kf[whichFrame].transform.colorTransform = resultColorTransform;
                  kf[whichFrame].emphasized = true;
                  ++i;
               }
            }
         };
         wipe = function():*
         {
            var _loc1_:MouseEvent = null;
            i = 1;
            while(i < lastFrame)
            {
               keyframeArray[i] = "";
               kf[i].transform.colorTransform = originalColorTransform;
               kf[i].emphasized = false;
               ++i;
            }
            keyframeArray[0] = defaultXAF;
            _loc1_ = new MouseEvent(MouseEvent.CLICK);
            kf[Number(keyframeBox.text)].dispatchEvent(_loc1_);
         };
         parseXAF = function(param1:*):*
         {
            var myXAF:* = undefined;
            var xmlData:* = undefined;
            var hasXAF:* = param1;
            myXAF = aTa.text;
            closeXAF();
            if(!hasXAF)
            {
               xmlData = new XML("<xaf>" + myXAF + "</xaf>");
            }
            else
            {
               xmlData = new XML(myXAF);
            }
            Tweener.updateTime();
            try
            {
               ROTByBone(ROTPelvisNode,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTPelvisNode"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfHip,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfHip"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfThigh,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfThigh"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfCalf,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfCalf"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfFoot,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFoot"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfToes,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfToes"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtHip,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtHip"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtThigh,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtThigh"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtCalf,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtCalf"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtFoot,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFoot"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtToes,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtToes"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTSpine01,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTSpine01"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTSpine02,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTSpine02"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTSpine03,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTSpine03"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTSpine04,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTSpine04"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTNeck01,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTNeck01"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTNeck02,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTNeck02"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTNeck03,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTNeck03"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTNeck04,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTNeck04"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTHead,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTHead"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfClavicle,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfClavicle"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfShoulder,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfShoulder"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfbicep,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfbicep"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfElbow,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfElbow"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfWrist,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfWrist"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfHand,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfHand"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfmetaCarpal03,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfmetaCarpal03"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfFingerMiddle01,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerMiddle01"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfFingerMiddle02,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerMiddle02"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfFingerMiddle03,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerMiddle03"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfmetaCarpal01,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfmetaCarpal01"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfThumb01d,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfThumb01d"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfThumb02,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfThumb02"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfThumb03,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfThumb03"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfmetaCarpal05,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfmetaCarpal05"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfFingerPinky01,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerPinky01"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfFingerPinky02,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerPinky02"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfFingerPinky03,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerPinky03"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfmetaCarpal02,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfmetaCarpal02"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfFingerIndex01,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerIndex01"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfFingerIndex02,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerIndex02"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfFingerIndex03,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerIndex03"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfmetaCarpal04,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfmetaCarpal04"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfFingerRing01,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerRing01"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfFingerRing02,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerRing02"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTlfFingerRing03,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTlfFingerRing03"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtClavicle,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtClavicle"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtShoulder,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtShoulder"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtBicep,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtBicep"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtElbow,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtElbow"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtWrist,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtWrist"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtHand,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtHand"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtmetaCarpal03,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtmetaCarpal03"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtFingerMiddle01,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerMiddle01"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtFingerMiddle02,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerMiddle02"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtFingerMiddle03,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerMiddle03"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtmetaCarpal01,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtmetaCarpal01"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtThumb01,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtThumb01"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtThumb02,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtThumb02"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtThumb03,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtThumb03"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtmetaCarpal05,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtmetaCarpal05"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtFingerPinky01,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerPinky01"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtFingerPinky02,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerPinky02"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtFingerPinky03,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerPinky03"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtmetaCarpal02,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtmetaCarpal02"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtFingerIndex01,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerIndex01"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtFingerIndex02,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerIndex02"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtFingerIndex03,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerIndex03"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtmetaCarpal04,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtmetaCarpal04"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtFingerRing01,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerRing01"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtFingerRing02,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerRing02"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               ROTByBone(ROTrtFingerRing03,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber["ROTrtFingerRing03"]).KEYFRAME[0].ROTATION);
            }
            catch(e:Error)
            {
            }
            try
            {
               TRANByBone(xmlData.ANIMATION.TRACK.(@BONEID == "1").KEYFRAME[0].TRANSLATION);
            }
            catch(e:Error)
            {
            }
         };
         doBtnResetBone = function():*
         {
            var xmlData:* = undefined;
            xmlData = new XML("<xaf>" + defaultXAF + "</xaf>");
            if(recallSelectedBone != ROTGround)
            {
               ROTByBone(recallSelectedBone,xmlData.ANIMATION.TRACK.(@BONEID == boneNumber[recallSelectedBone.name]).KEYFRAME[0].ROTATION);
            }
            else
            {
               TRANByBone("0 -0.0000282434 663.894");
            }
         };
         TRANByBone = function(param1:*):*
         {
            var _loc2_:* = undefined;
            _loc2_ = param1.split(" ");
            Tweener.addTween(ROTGround,{
               "x":-Number(_loc2_[0]),
               "y":-80 - Number(_loc2_[2]),
               "z":-Number(_loc2_[1]),
               "transition":"easeoutelastic",
               "time":1
            });
         };
         ROTByBone = function(param1:*, param2:*):*
         {
            var _loc3_:* = undefined;
            var _loc4_:* = undefined;
            _loc3_ = param2.split(" ");
            _loc4_ = new Quaternion(_loc3_[0],_loc3_[2],_loc3_[1],_loc3_[3]);
            doSlerp(param1,_loc4_,1);
         };
         doSlerp = function(param1:Object, param2:Quaternion, param3:Number):void
         {
            var extraObject:Object = null;
            var originalQuaternion:Quaternion = null;
            var objectToRotate:Object = param1;
            var targetQuaternion:Quaternion = param2;
            var rotationTime:Number = param3;
            extraObject = {};
            extraObject.slerp = 0;
            objectToRotate.extra = extraObject;
            originalQuaternion = Quaternion.createFromMatrix(objectToRotate.transform);
            Tweener.addTween(objectToRotate.extra,{
               "slerp":1,
               "transition":"easeoutelastic",
               "time":rotationTime,
               "onUpdate":function():*
               {
                  objectToRotate.transform.copy3x3(Quaternion.slerp(originalQuaternion,targetQuaternion,this.slerp).matrix);
               }
            });
         };
         sixDig = function(param1:*):*
         {
            return Math.round(param1 * 10000000) / 10000000;
         };
         PV2IMVU = function(param1:*):*
         {
            var _loc2_:* = undefined;
            var _loc3_:* = undefined;
            var _loc4_:* = undefined;
            _loc2_ = Quaternion.createFromMatrix(Matrix3D.clone(param1.transform));
            _loc2_ = Matrix3D.normalizeQuaternion(_loc2_);
            _loc3_ = _loc2_.y;
            _loc2_.y = _loc2_.z;
            _loc2_.z = _loc3_;
            _loc2_.w = -_loc2_.w;
            _loc2_.x = -_loc2_.x;
            _loc2_.z = -_loc2_.z;
            return -sixDig(_loc2_.x) + " " + sixDig(_loc2_.y) + " " + sixDig(-_loc2_.z) + " " + sixDig(-_loc2_.w);
         };
         checkKeysDown = function(param1:KeyboardEvent):void
         {
            if(param1.keyCode == 16)
            {
               shiftDown = true;
            }
            if(param1.keyCode == 17)
            {
               controlDown = true;
            }
            if(param1.keyCode == 76)
            {
               doBtnResetView_L();
            }
            if(param1.keyCode == 82)
            {
               doBtnResetView_R();
            }
            if(param1.keyCode == 65)
            {
               doBtnResetView_A();
            }
            if(param1.keyCode == 85)
            {
               doBtnResetView_U();
            }
            if(param1.keyCode == 70)
            {
               doBtnResetView();
            }
            if(param1.keyCode == 66)
            {
               doBtnResetView_B();
            }
            if(param1.keyCode == 88 || param1.keyCode == 80)
            {
               myDropDown.selectedIndex = 1;
               setThingy();
            }
            if(param1.keyCode == 89)
            {
               myDropDown.selectedIndex = 2;
               setThingy();
            }
            if(param1.keyCode == 90)
            {
               myDropDown.selectedIndex = 3;
               setThingy();
            }
            if(param1.keyCode == 79)
            {
               myDropDown.selectedIndex = 0;
               setThingy();
            }
         };
         checkKeysUp = function(param1:KeyboardEvent):void
         {
            shiftDown = false;
            controlDown = false;
            if(param1.keyCode == 77)
            {
               btnBoneZoom.selected = !btnBoneZoom.selected;
            }
            if(param1.keyCode == 84)
            {
               btnThingy.selected = !btnThingy.selected;
               thingyToggle();
            }
         };
         onPress = function(param1:InteractiveScene3DEvent):void
         {
         };
         makeXAF = function():*
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            var _loc3_:* = undefined;
            var _loc4_:* = undefined;
            var _loc5_:* = undefined;
            var _loc6_:* = undefined;
            var _loc7_:* = undefined;
            var _loc8_:* = undefined;
            var _loc9_:* = undefined;
            var _loc10_:* = undefined;
            var _loc11_:* = undefined;
            var _loc12_:* = undefined;
            var _loc13_:* = undefined;
            _loc1_ = "<HEADER MAGIC=\"XAF\" VERSION=\"919\" />\r\n";
            _loc2_ = "<ANIMATION NUMTRACKS=\"72\" DURATION=\"" + durationStepper.value + "\">\r\n";
            _loc3_ = "    <TRACK BONEID=\"";
            _loc4_ = "\" NUMKEYFRAMES=\"1\">\r\n";
            _loc5_ = "        <KEYFRAME TIME=\"0\">\r\n";
            _loc6_ = "            <ROTATION>";
            _loc7_ = "</ROTATION>\r\n";
            _loc8_ = "        </KEYFRAME>\r\n";
            _loc9_ = "    </TRACK>\r\n";
            _loc10_ = "</ANIMATION>";
            _loc11_ = _loc4_ + _loc5_ + _loc6_;
            _loc12_ = _loc7_ + _loc8_ + _loc9_;
            _loc13_ = _loc1_ + _loc2_;
            _loc13_ = _loc13_ + (_loc3_ + "1" + _loc4_ + _loc5_ + "            <TRANSLATION>" + -ROTGround.x + " " + -ROTGround.z + " " + (-ROTGround.y - 80) + "</TRANSLATION>\r\n" + _loc6_ + PV2IMVU(ROTPelvisNode) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "2" + _loc11_ + PV2IMVU(ROTlfHip) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "3" + _loc11_ + PV2IMVU(ROTlfThigh) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "4" + _loc11_ + PV2IMVU(ROTlfCalf) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "5" + _loc11_ + PV2IMVU(ROTlfFoot) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "6" + _loc11_ + PV2IMVU(ROTlfToes) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "8" + _loc11_ + PV2IMVU(ROTrtHip) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "9" + _loc11_ + PV2IMVU(ROTrtThigh) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "10" + _loc11_ + PV2IMVU(ROTrtCalf) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "11" + _loc11_ + PV2IMVU(ROTrtFoot) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "12" + _loc11_ + PV2IMVU(ROTrtToes) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "14" + _loc11_ + PV2IMVU(ROTSpine01) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "15" + _loc11_ + PV2IMVU(ROTSpine02) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "16" + _loc11_ + PV2IMVU(ROTSpine03) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "17" + _loc11_ + PV2IMVU(ROTSpine04) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "18" + _loc11_ + PV2IMVU(ROTNeck01) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "19" + _loc11_ + PV2IMVU(ROTNeck02) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "20" + _loc11_ + PV2IMVU(ROTNeck03) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "21" + _loc11_ + PV2IMVU(ROTNeck04) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "22" + _loc11_ + PV2IMVU(ROTHead) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "24" + _loc11_ + PV2IMVU(ROTlfClavicle) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "25" + _loc11_ + PV2IMVU(ROTlfShoulder) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "26" + _loc11_ + PV2IMVU(ROTlfbicep) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "27" + _loc11_ + PV2IMVU(ROTlfElbow) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "28" + _loc11_ + PV2IMVU(ROTlfWrist) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "29" + _loc11_ + PV2IMVU(ROTlfHand) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "30" + _loc11_ + PV2IMVU(ROTlfmetaCarpal03) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "31" + _loc11_ + PV2IMVU(ROTlfFingerMiddle01) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "32" + _loc11_ + PV2IMVU(ROTlfFingerMiddle02) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "33" + _loc11_ + PV2IMVU(ROTlfFingerMiddle03) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "35" + _loc11_ + PV2IMVU(ROTlfmetaCarpal01) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "36" + _loc11_ + PV2IMVU(ROTlfThumb01d) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "37" + _loc11_ + PV2IMVU(ROTlfThumb02) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "38" + _loc11_ + PV2IMVU(ROTlfThumb03) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "40" + _loc11_ + PV2IMVU(ROTlfmetaCarpal05) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "41" + _loc11_ + PV2IMVU(ROTlfFingerPinky01) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "42" + _loc11_ + PV2IMVU(ROTlfFingerPinky02) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "43" + _loc11_ + PV2IMVU(ROTlfFingerPinky03) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "45" + _loc11_ + PV2IMVU(ROTlfmetaCarpal02) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "46" + _loc11_ + PV2IMVU(ROTlfFingerIndex01) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "47" + _loc11_ + PV2IMVU(ROTlfFingerIndex02) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "48" + _loc11_ + PV2IMVU(ROTlfFingerIndex03) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "50" + _loc11_ + PV2IMVU(ROTlfmetaCarpal04) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "51" + _loc11_ + PV2IMVU(ROTlfFingerRing01) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "52" + _loc11_ + PV2IMVU(ROTlfFingerRing02) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "53" + _loc11_ + PV2IMVU(ROTlfFingerRing03) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "55" + _loc11_ + PV2IMVU(ROTrtClavicle) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "56" + _loc11_ + PV2IMVU(ROTrtShoulder) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "57" + _loc11_ + PV2IMVU(ROTrtBicep) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "58" + _loc11_ + PV2IMVU(ROTrtElbow) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "59" + _loc11_ + PV2IMVU(ROTrtWrist) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "60" + _loc11_ + PV2IMVU(ROTrtHand) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "61" + _loc11_ + PV2IMVU(ROTrtmetaCarpal03) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "62" + _loc11_ + PV2IMVU(ROTrtFingerMiddle01) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "63" + _loc11_ + PV2IMVU(ROTrtFingerMiddle02) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "64" + _loc11_ + PV2IMVU(ROTrtFingerMiddle03) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "66" + _loc11_ + PV2IMVU(ROTrtmetaCarpal01) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "67" + _loc11_ + PV2IMVU(ROTrtThumb01) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "68" + _loc11_ + PV2IMVU(ROTrtThumb02) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "69" + _loc11_ + PV2IMVU(ROTrtThumb03) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "71" + _loc11_ + PV2IMVU(ROTrtmetaCarpal05) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "72" + _loc11_ + PV2IMVU(ROTrtFingerPinky01) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "73" + _loc11_ + PV2IMVU(ROTrtFingerPinky02) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "74" + _loc11_ + PV2IMVU(ROTrtFingerPinky03) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "76" + _loc11_ + PV2IMVU(ROTrtmetaCarpal02) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "77" + _loc11_ + PV2IMVU(ROTrtFingerIndex01) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "78" + _loc11_ + PV2IMVU(ROTrtFingerIndex02) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "79" + _loc11_ + PV2IMVU(ROTrtFingerIndex03) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "81" + _loc11_ + PV2IMVU(ROTrtmetaCarpal04) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "82" + _loc11_ + PV2IMVU(ROTrtFingerRing01) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "83" + _loc11_ + PV2IMVU(ROTrtFingerRing02) + _loc12_);
            _loc13_ = _loc13_ + (_loc3_ + "84" + _loc11_ + PV2IMVU(ROTrtFingerRing03) + _loc12_);
            return _loc13_ + _loc10_;
         };
         doGetXAF = function():*
         {
            var _loc1_:String = null;
            var _loc2_:Array = null;
            var _loc3_:Array = null;
            var _loc4_:Array = null;
            var _loc5_:* = undefined;
            var _loc6_:* = undefined;
            var _loc7_:* = undefined;
            var _loc8_:* = undefined;
            var _loc9_:* = undefined;
            if(kfNum == 0)
            {
               keyframeArray[0] = makeXAF();
            }
            FlyBtnClose.visible = true;
            aTa.x = 50;
            aTa.y = 50;
            aTa.width = 456;
            aTa.height = 400;
            _loc2_ = new Array();
            _loc3_ = new Array();
            _loc4_ = new Array();
            _loc5_ = 0;
            i = 0;
            while(i < lastFrame)
            {
               if(keyframeArray[i] != "")
               {
                  _loc3_[_loc5_] = keyframeArray[i];
                  _loc4_[_loc5_] = i / (lastFrame - 1) * Number(durationStepper.value);
                  _loc5_++;
               }
               ++i;
            }
            _loc6_ = keyframeArray[kfNum];
            if(controlDown || _loc5_ == 1)
            {
               if(_loc6_ == "")
               {
                  _loc1_ = "This frame is not a keyframe. Please click on a bone to convert it to a keyframe before saving it.\n\nNothing has been saved to your clipboard =)";
               }
               else
               {
                  _loc1_ = "The xaf for this pose has been copied to your clipboard. Please paste it into a file with a \'.xaf\' extension.";
                  System.setClipboard(_loc6_);
               }
               aTa.visible = true;
               aTa.text = _loc1_;
            }
            else
            {
               if(shiftDown)
               {
                  _loc7_ = durationStepper.value;
                  _loc1_ = "A \'master\' copy of this animation has been copied to your clipboard.\n\nSave it and you can re-load it into this program at a later date =)";
               }
               else
               {
                  _loc7_ = _loc4_[_loc5_ - 1];
                  _loc1_ = "The animation has been copied to your clipboard. Please paste it into a file with a \'.xaf\' extension.\n\nIf you wish to save a \'master\' xaf to continue editing this animation later, please click on save while holding down the shift key.";
               }
               _loc6_ = "<HEADER MAGIC=\"XAF\" VERSION=\"919\" />\n<ANIMATION NUMTRACKS=\"72\" DURATION=\"" + _loc7_ + "\">\n";
               _loc8_ = 1;
               while(_loc8_ <= 84)
               {
                  switch(_loc8_)
                  {
                     case 7:
                     case 13:
                     case 23:
                     case 34:
                     case 39:
                     case 44:
                     case 49:
                     case 54:
                     case 65:
                     case 70:
                     case 75:
                     case 80:
                        _loc8_++;
                  }
                  _loc6_ = _loc6_ + "    <TRACK BONEID=\"" + _loc8_ + "\" NUMKEYFRAMES=\"" + _loc5_ + "\">\n";
                  _loc9_ = 0;
                  while(_loc9_ < _loc5_)
                  {
                     _loc6_ = _loc6_ + getKf(_loc3_[_loc9_],_loc8_,_loc4_[_loc9_]) + "\n";
                     _loc9_++;
                  }
                  _loc6_ += "    </TRACK>\n";
                  _loc8_++;
               }
               _loc6_ += "</ANIMATION>";
            }
            _loc6_ = _loc6_.split("\n").join("\r\n");
            System.setClipboard(_loc6_);
            aTa.visible = true;
            aTa.text = _loc1_;
         };
         getKf = function(param1:*, param2:*, param3:*):*
         {
            var thisXML:* = undefined;
            var seg:* = undefined;
            var myFile:* = param1;
            var boneid:* = param2;
            var time:* = param3;
            thisXML = new XML("<xaf>" + myFile + "</xaf>");
            seg = thisXML.ANIMATION.TRACK.(@BONEID == boneid).KEYFRAME[0].toString();
            seg = seg.split("TIME=\"0\"").join("TIME=\"" + time + "\"");
            return seg;
         };
         onStageMouseDown = function(param1:MouseEvent):void
         {
            isMouseDown = true;
            mousePos = new Point(stage.mouseX,stage.mouseY);
            pose = Matrix3D.clone(trackball.transform);
         };
         onStageMouseUp = function(param1:MouseEvent):void
         {
            var _loc2_:* = undefined;
            _loc2_ = selectedBone;
            TBDown = false;
            isMouseDown = false;
            selectedBone = MyRoot;
            gizmoNow = "";
            Move(selectedBone);
            if(_loc2_.name != "14")
            {
               keyframeArray[Number(keyframeBox.text)] = makeXAF();
               kf[Number(keyframeBox.text)].transform.colorTransform = resultColorTransform;
               kf[Number(keyframeBox.text)].emphasized = true;
            }
         };
         onBone = function(param1:InteractiveScene3DEvent):void
         {
            gizmo.parent.removeChild(gizmo);
            param1.target.parent.parent.addChild(gizmo);
            gizmo.x = param1.target.parent.x;
            gizmo.y = param1.target.parent.y;
            gizmo.z = param1.target.parent.z;
            BoneName.text = param1.target.name;
            if(recallSelectedBone != param1.target.parent)
            {
               switch(jointType[param1.target.name])
               {
                  case "Ball & socket":
                     myDropDown.selectedIndex = 0;
                     break;
                  case "Pivot":
                     myDropDown.selectedIndex = 1;
                     break;
                  case "Hinge Y":
                     myDropDown.selectedIndex = 2;
                     break;
                  case "Hinge Z":
                     myDropDown.selectedIndex = 3;
                     break;
                  case "Saddle":
                     myDropDown.selectedIndex = 4;
                     break;
                  case "Fixed":
                     myDropDown.selectedIndex = 5;
               }
               setThingy();
            }
            selectedBone = param1.target.parent;
            recallSelectedBone = selectedBone;
            Move(selectedBone);
         };
         Move = function(param1:*):*
         {
            var _loc2_:* = undefined;
            var _loc3_:* = undefined;
            var _loc4_:* = undefined;
            TBDown = true;
            if(btnBoneZoom.selected)
            {
               if(selectedBone != MyRoot)
               {
                  LookAtNode.transform = selectedBone.world;
                  _loc2_ = LookAtNode.x;
                  _loc3_ = LookAtNode.y;
                  _loc4_ = LookAtNode.z;
                  Tweener.addTween(camera,{
                     "x":_loc2_,
                     "y":_loc3_,
                     "transition":"easeInOutCirc",
                     "time":0.4
                  });
               }
            }
            trackball.transform.copy3x3(selectedBone.transform);
         };
         onEnterFrame = function(param1:Event):void
         {
            var _loc2_:int = 0;
            var _loc3_:int = 0;
            var _loc4_:Matrix3D = null;
            var _loc5_:Matrix3D = null;
            var _loc6_:Matrix3D = null;
            var _loc7_:Matrix3D = null;
            var _loc8_:Matrix3D = null;
            var _loc9_:Matrix3D = null;
            var _loc10_:* = undefined;
            var _loc11_:* = undefined;
            if(isMouseDown)
            {
               _loc2_ = stage.mouseX - mousePos.x;
               _loc3_ = stage.mouseY - mousePos.y;
               _loc4_ = Matrix3D.rotationMatrix(0,1,0,-0.01 * _loc2_);
               _loc5_ = Matrix3D.rotationMatrix(1,0,0,-0.01 * _loc3_);
               _loc6_ = Matrix3D.rotationMatrix(1,0,0,-0.01 * _loc2_);
               _loc7_ = Matrix3D.rotationMatrix(0,0,1,-0.01 * _loc2_);
               _loc8_ = Matrix3D.rotationMatrix(0,0,1,-0.01 * _loc3_);
               _loc9_ = Matrix3D.multiply(_loc5_,_loc4_);
               _loc10_ = myDropDown.selectedIndex;
               switch(gizmoNow)
               {
                  case "X":
                     _loc10_ = 1;
                     break;
                  case "Y":
                     _loc10_ = 2;
                     break;
                  case "Z":
                     _loc10_ = 3;
               }
               if(selectedBone == MyRoot)
               {
                  _loc10_ = -1;
               }
               if(selectedBone == ROTGround)
               {
                  _loc10_ = 6;
               }
               switch(_loc10_)
               {
                  case 0:
                     trackball.transform = Matrix3D.multiply(_loc9_,pose);
                     break;
                  case 1:
                     trackball.transform = Matrix3D.multiply(_loc6_,pose);
                     break;
                  case 3:
                     trackball.transform = Matrix3D.multiply(_loc7_,pose);
                     break;
                  case 2:
                     trackball.transform = Matrix3D.multiply(_loc4_,pose);
                     break;
                  case 4:
                     _loc11_ = Matrix3D.multiply(_loc8_,pose);
                     trackball.transform = Matrix3D.multiply(_loc11_,_loc4_);
                     break;
                  case 5:
                     trackball.transform = pose;
                     break;
                  case 6:
                     if(shiftDown)
                     {
                        ROTGround.x += _loc2_ * 2;
                        ROTGround.z -= _loc3_ * 2;
                     }
                     else
                     {
                        ROTGround.y -= _loc3_ * 2;
                     }
                     trackball.transform = pose;
                     break;
                  case -1:
                     if(!btnBoneZoom.selected)
                     {
                        trackball.transform = Matrix3D.multiply(_loc9_,pose);
                     }
                     else
                     {
                        trackball.transform = Matrix3D.multiply(_loc4_,pose);
                        camera.z -= _loc3_ * 10;
                     }
               }
               pose = Matrix3D.clone(trackball.transform);
               mousePos = new Point(stage.mouseX,stage.mouseY);
               selectedBone.transform.copy3x3(trackball.transform);
            }
            renderer.renderScene(scene,camera,viewport);
         };
         kfNum = 0;
         lastFrame = 188;
         keyframeArray = new Array();
         i = 0;
         while(i < lastFrame)
         {
            keyframeArray[i] = "";
            i++;
         }
         viewport = new Viewport3D(570,570,false,true);
         addChild(viewport);
         scene = new Scene3D();
         camera = new Camera3D();
         renderer = new BasicRenderEngine();
         pointLight = new PointLight3D(true,false);
         pointLight.x = -200;
         pointLight.y = 500;
         pointLight.z = -500;
         bitmapAssetMat = new BitmapAssetMaterial("DeliveranceFloor");
         bitmapAssetMat.smooth = true;
         bitmapAssetMat.oneSide = true;
         bitmapAssetMat.interactive = true;
         flatShaderMat = new FlatShadeMaterial(pointLight,14548992,3355443);
         flatShaderMat.doubleSided = false;
         m2 = new MaterialsList();
         flatShaderMat.interactive = true;
         m2.addMaterial(flatShaderMat,"all");
         flatShaderMat3 = new FlatShadeMaterial(pointLight,3355443,4473924);
         flatShaderMat3.doubleSided = false;
         m3 = new MaterialsList();
         flatShaderMat3.interactive = true;
         m3.addMaterial(flatShaderMat3,"all");
         colorMat = new ColorMaterial(1122867);
         wireMat = new WireframeMaterial(16777215);
         comMat = new CompositeMaterial();
         comMat.interactive = true;
         comMat.addMaterial(colorMat);
         comMat.addMaterial(wireMat);
         ml = new MaterialsList({"all":comMat});
         sphMat = matSphereComposite = new CompositeMaterial();
         matSphereComposite.addMaterial(new ColorMaterial(0,0.7));
         matSphereComposite.addMaterial(new WireframeMaterial(16724736,100));
         sphMat.interactive = true;
         trackball = new Sphere(sphMat,100,12,12);
         selectedBone = trackball;
         caret.x = 5;
         aTa = new TextArea();
         aTa.x = 20;
         aTa.y = 20;
         aTa.width = 400;
         aTa.height = 400;
         addChild(aTa);
         aTa.visible = false;
         tooltip = new Label();
         tooltip.y = 529;
         tooltip.text = "";
         addChild(tooltip);
         kf = new Array();
         b = 0;
         while(b <= lastFrame - 1)
         {
            kf[b] = new Button();
            kf[b].x = b * 3 + 3;
            kf[b].y = 546;
            kf[b].label = b;
            kf[b].width = 3;
            addChild(kf[b]);
            kf[b].addEventListener(MouseEvent.MOUSE_OVER,tooltipMouseOver);
            kf[b].addEventListener(MouseEvent.MOUSE_OUT,tooltipMouseOut);
            kf[b].addEventListener(MouseEvent.CLICK,tooltipMouseClick);
            b++;
         }
         FlyBtnClose = new Button();
         FlyBtnClose.x = 403;
         FlyBtnClose.y = 453;
         FlyBtnClose.alpha = 100;
         FlyBtnClose.label = "Close";
         FlyBtnClose.visible = false;
         addChild(FlyBtnClose);
         FlyBtnClose.addEventListener(MouseEvent.CLICK,closeXAF);
         FlyBtnLoad = new Button();
         FlyBtnLoad.x = 303;
         FlyBtnLoad.y = 453;
         FlyBtnLoad.alpha = 100;
         FlyBtnLoad.label = "Load";
         FlyBtnLoad.visible = false;
         addChild(FlyBtnLoad);
         FlyBtnLoad.addEventListener(MouseEvent.CLICK,LOADparseXAF);
         FlyBtnYes = new Button();
         FlyBtnYes.x = 185;
         FlyBtnYes.y = 260;
         FlyBtnYes.alpha = 100;
         FlyBtnYes.label = "Yes";
         FlyBtnYes.visible = false;
         addChild(FlyBtnYes);
         FlyBtnYes.addEventListener(MouseEvent.CLICK,doFlyBtnYes);
         FlyBtnNo = new Button();
         FlyBtnNo.x = 285;
         FlyBtnNo.y = 260;
         FlyBtnNo.alpha = 100;
         FlyBtnNo.label = "Cancel";
         FlyBtnNo.visible = false;
         addChild(FlyBtnNo);
         FlyBtnNo.addEventListener(MouseEvent.CLICK,doFlyBtnNo);
         boneNumber["ROTPelvisNode"] = "1";
         boneNumber["ROTlfHip"] = "2";
         boneNumber["ROTlfThigh"] = "3";
         boneNumber["ROTlfCalf"] = "4";
         boneNumber["ROTlfFoot"] = "5";
         boneNumber["ROTlfToes"] = "6";
         boneNumber["ROTrtHip"] = "8";
         boneNumber["ROTrtThigh"] = "9";
         boneNumber["ROTrtCalf"] = "10";
         boneNumber["ROTrtFoot"] = "11";
         boneNumber["ROTrtToes"] = "12";
         boneNumber["ROTSpine01"] = "14";
         boneNumber["ROTSpine02"] = "15";
         boneNumber["ROTSpine03"] = "16";
         boneNumber["ROTSpine04"] = "17";
         boneNumber["ROTNeck01"] = "18";
         boneNumber["ROTNeck02"] = "19";
         boneNumber["ROTNeck03"] = "20";
         boneNumber["ROTNeck04"] = "21";
         boneNumber["ROTHead"] = "22";
         boneNumber["ROTlfClavicle"] = "24";
         boneNumber["ROTlfShoulder"] = "25";
         boneNumber["ROTlfbicep"] = "26";
         boneNumber["ROTlfElbow"] = "27";
         boneNumber["ROTlfWrist"] = "28";
         boneNumber["ROTlfHand"] = "29";
         boneNumber["ROTlfmetaCarpal03"] = "30";
         boneNumber["ROTlfFingerMiddle01"] = "31";
         boneNumber["ROTlfFingerMiddle02"] = "32";
         boneNumber["ROTlfFingerMiddle03"] = "33";
         boneNumber["ROTlfmetaCarpal01"] = "35";
         boneNumber["ROTlfThumb01d"] = "36";
         boneNumber["ROTlfThumb02"] = "37";
         boneNumber["ROTlfThumb03"] = "38";
         boneNumber["ROTlfmetaCarpal05"] = "40";
         boneNumber["ROTlfFingerPinky01"] = "41";
         boneNumber["ROTlfFingerPinky02"] = "42";
         boneNumber["ROTlfFingerPinky03"] = "43";
         boneNumber["ROTlfmetaCarpal02"] = "45";
         boneNumber["ROTlfFingerIndex01"] = "46";
         boneNumber["ROTlfFingerIndex02"] = "47";
         boneNumber["ROTlfFingerIndex03"] = "48";
         boneNumber["ROTlfmetaCarpal04"] = "50";
         boneNumber["ROTlfFingerRing01"] = "51";
         boneNumber["ROTlfFingerRing02"] = "52";
         boneNumber["ROTlfFingerRing03"] = "53";
         boneNumber["ROTrtClavicle"] = "55";
         boneNumber["ROTrtShoulder"] = "56";
         boneNumber["ROTrtBicep"] = "57";
         boneNumber["ROTrtElbow"] = "58";
         boneNumber["ROTrtWrist"] = "59";
         boneNumber["ROTrtHand"] = "60";
         boneNumber["ROTrtmetaCarpal03"] = "61";
         boneNumber["ROTrtFingerMiddle01"] = "62";
         boneNumber["ROTrtFingerMiddle02"] = "63";
         boneNumber["ROTrtFingerMiddle03"] = "64";
         boneNumber["ROTrtmetaCarpal01"] = "66";
         boneNumber["ROTrtThumb01"] = "67";
         boneNumber["ROTrtThumb02"] = "68";
         boneNumber["ROTrtThumb03"] = "69";
         boneNumber["ROTrtmetaCarpal05"] = "71";
         boneNumber["ROTrtFingerPinky01"] = "72";
         boneNumber["ROTrtFingerPinky02"] = "73";
         boneNumber["ROTrtFingerPinky03"] = "74";
         boneNumber["ROTrtmetaCarpal02"] = "76";
         boneNumber["ROTrtFingerIndex01"] = "77";
         boneNumber["ROTrtFingerIndex02"] = "78";
         boneNumber["ROTrtFingerIndex03"] = "79";
         boneNumber["ROTrtmetaCarpal04"] = "81";
         boneNumber["ROTrtFingerRing01"] = "82";
         boneNumber["ROTrtFingerRing02"] = "83";
         boneNumber["ROTrtFingerRing03"] = "84";
         jointType["MyRoot"] = "Ball & socket";
         jointType["PelvisNode"] = "Ball & socket";
         jointType["lfHip"] = "Fixed";
         jointType["lfThigh"] = "Ball & socket";
         jointType["lfCalf"] = "Hinge Z";
         jointType["lfFoot"] = "Saddle";
         jointType["lfToes"] = "Hinge Z";
         jointType["rtHip"] = "Fixed";
         jointType["rtThigh"] = "Ball & socket";
         jointType["rtCalf"] = "Hinge Z";
         jointType["rtFoot"] = "Saddle";
         jointType["rtToes"] = "Hinge Z";
         jointType["Spine01"] = "Ball & socket";
         jointType["Spine02"] = "Ball & socket";
         jointType["Spine03"] = "Ball & socket";
         jointType["Spine04"] = "Ball & socket";
         jointType["Neck01"] = "Ball & socket";
         jointType["Neck02"] = "Ball & socket";
         jointType["Neck03"] = "Ball & socket";
         jointType["Neck04"] = "Ball & socket";
         jointType["Head"] = "Ball & socket";
         jointType["lfClavicle"] = "Fixed";
         jointType["lfShoulder"] = "Ball & socket";
         jointType["lfbicep"] = "Pivot";
         jointType["lfElbow"] = "Hinge Y";
         jointType["lfWrist"] = "Pivot";
         jointType["lfHand"] = "Saddle";
         jointType["lfmetaCarpal03"] = "Fixed";
         jointType["lfFingerMiddle01"] = "Saddle";
         jointType["lfFingerMiddle02"] = "Hinge Z";
         jointType["lfFingerMiddle03"] = "Hinge Z";
         jointType["lfmetaCarpal01"] = "Fixed";
         jointType["lfThumb01d"] = "Saddle";
         jointType["lfThumb02"] = "Hinge Z";
         jointType["lfThumb03"] = "Hinge Z";
         jointType["lfmetaCarpal05"] = "Fixed";
         jointType["lfFingerPinky01"] = "Saddle";
         jointType["lfFingerPinky02"] = "Hinge Z";
         jointType["lfFingerPinky03"] = "Hinge Z";
         jointType["lfmetaCarpal02"] = "Fixed";
         jointType["lfFingerIndex01"] = "Saddle";
         jointType["lfFingerIndex02"] = "Hinge Z";
         jointType["lfFingerIndex03"] = "Hinge Z";
         jointType["lfmetaCarpal04"] = "Fixed";
         jointType["lfFingerRing01"] = "Saddle";
         jointType["lfFingerRing02"] = "Hinge Z";
         jointType["lfFingerRing03"] = "Hinge Z";
         jointType["rtClavicle"] = "Fixed";
         jointType["rtShoulder"] = "Ball & socket";
         jointType["rtBicep"] = "Pivot";
         jointType["rtElbow"] = "Hinge Y";
         jointType["rtWrist"] = "Pivot";
         jointType["rtHand"] = "Saddle";
         jointType["rtmetaCarpal03"] = "Fixed";
         jointType["rtFingerMiddle01"] = "Saddle";
         jointType["rtFingerMiddle02"] = "Hinge Z";
         jointType["rtFingerMiddle03"] = "Hinge Z";
         jointType["rtmetaCarpal01"] = "Fixed";
         jointType["rtThumb01"] = "Saddle";
         jointType["rtThumb02"] = "Hinge Z";
         jointType["rtThumb03"] = "Hinge Z";
         jointType["rtmetaCarpal05"] = "Fixed";
         jointType["rtFingerPinky01"] = "Saddle";
         jointType["rtFingerPinky02"] = "Hinge Z";
         jointType["rtFingerPinky03"] = "Hinge Z";
         jointType["rtmetaCarpal02"] = "Fixed";
         jointType["rtFingerIndex01"] = "Saddle";
         jointType["rtFingerIndex02"] = "Hinge Z";
         jointType["rtFingerIndex03"] = "Hinge Z";
         jointType["rtmetaCarpal04"] = "Fixed";
         jointType["rtFingerRing01"] = "Saddle";
         jointType["rtFingerRing02"] = "Hinge Z";
         jointType["rtFingerRing03"] = "Hinge Z";
         jointType["Ground"] = "Fixed";
         L_MyRoot = 0;
         L_PelvisNode = 0;
         L_lfHip = 62.104;
         L_lfThigh = 320.518;
         L_lfCalf = 304.479;
         L_lfFoot = 102.041;
         L_lfToes = 76.433;
         L_rtHip = 62.104;
         L_rtThigh = 320.518;
         L_rtCalf = 304.479;
         L_rtFoot = 102.041;
         L_rtToes = 76.433;
         L_Spine01 = 39.564;
         L_Spine02 = 48.71;
         L_Spine03 = 58.982;
         L_Spine04 = 106.241;
         L_Neck01 = 19.644;
         L_Neck02 = 14.213;
         L_Neck03 = 15.369;
         L_Neck04 = 19.532;
         L_Head = 57.656;
         L_lfClavicle = 119.278;
         L_lfShoulder = 19.399;
         L_lfbicep = 154.925;
         L_lfElbow = 87.945;
         L_lfWrist = 59.086;
         L_lfHand = 15.916;
         L_lfmetaCarpal03 = 68.382;
         L_lfFingerMiddle01 = 29.382;
         L_lfFingerMiddle02 = 24.077;
         L_lfFingerMiddle03 = 24.457;
         L_lfmetaCarpal01 = 26.288;
         L_lfThumb01d = 21.019;
         L_lfThumb02 = 27.415;
         L_lfThumb03 = 21.359;
         L_lfmetaCarpal05 = 67.682;
         L_lfFingerPinky01 = 22.109;
         L_lfFingerPinky02 = 18.591;
         L_lfFingerPinky03 = 21.208;
         L_lfmetaCarpal02 = 70.936;
         L_lfFingerIndex01 = 24.718;
         L_lfFingerIndex02 = 21.128;
         L_lfFingerIndex03 = 19.796;
         L_lfmetaCarpal04 = 68.48;
         L_lfFingerRing01 = 26.91;
         L_lfFingerRing02 = 21.798;
         L_lfFingerRing03 = 22.174;
         L_rtClavicle = 119.278;
         L_rtShoulder = 19.399;
         L_rtBicep = 154.925;
         L_rtElbow = 87.945;
         L_rtWrist = 59.086;
         L_rtHand = 15.916;
         L_rtmetaCarpal03 = 68.382;
         L_rtFingerMiddle01 = 29.382;
         L_rtFingerMiddle02 = 24.077;
         L_rtFingerMiddle03 = 24.457;
         L_rtmetaCarpal01 = 26.288;
         L_rtThumb01 = 21.019;
         L_rtThumb02 = 27.415;
         L_rtThumb03 = 21.359;
         L_rtmetaCarpal05 = 67.682;
         L_rtFingerPinky01 = 22.109;
         L_rtFingerPinky02 = 18.591;
         L_rtFingerPinky03 = 21.208;
         L_rtmetaCarpal02 = 70.936;
         L_rtFingerIndex01 = 24.718;
         L_rtFingerIndex02 = 21.128;
         L_rtFingerIndex03 = 19.796;
         L_rtmetaCarpal04 = 68.48;
         L_rtFingerRing01 = 26.91;
         L_rtFingerRing02 = 21.798;
         L_rtFingerRing03 = 22.174;
         defaultXAF = "<HEADER MAGIC=\"XAF\" VERSION=\"919\" /> <ANIMATION NUMTRACKS=\"72\" DURATION=\"5\"> <TRACK BONEID=\"1\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <TRANSLATION>0 -0.0000282434 663.894</TRANSLATION> <ROTATION>0 0 0 1</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"2\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.705721 0.0035173 0.0442479 0.707098</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"3\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0029335 -0.0260022 0.6981489 0.7154742</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"4\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0189131 -0.0307881 -0.0195522 0.9991557</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"5\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0222693 0.396756 0.0086796 0.9176129</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"6\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0089054 0.3955458 0.0229391 0.9181165</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"8\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0035593 -0.7056868 0.7070978 0.044789</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"9\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0023106 -0.0267775 -0.6964318 0.7171195</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"10\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0021152 -0.031013 0.0166779 0.9993776</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"11\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0085194 0.3965093 0.015509 0.9178602</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"12\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0140835 0.396294 -0.002191 0.918013</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"14\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.543753 0.54377 -0.452014 0.452029</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"15\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.7069806 -0.0138841 0.0138947 0.7069601</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"16\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>2e-7 -1e-7 0.0414296 0.9991414</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"17\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0000016 7e-7 0.1820531 0.9832887</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"18\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0000014 2e-7 -0.156601 0.9876619</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"19\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0000052 -1e-7 0.0094954 0.9999549</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"20\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.000004 0.0000041 0.0328939 0.9994588</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"21\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>7e-7 -0.0000113 -0.0389906 0.9992396</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"22\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0000035 -7e-7 -0.0001823 1</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"24\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.3998879 0.5978718 0.4385659 0.538794</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"25\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.6909299 -0.154784 0.128293 0.6944053</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"26\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.011225 0.0402978 0.004541 0.9991143</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"27\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0266463 0.0301495 0.0789177 0.9960688</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"28\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0042221 0.0002745 0.0148755 0.9998804</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"29\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0 0.0020181 0.0088058 0.9999592</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"30\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0030542 -0.0030073 0.0205676 0.9997793</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"31\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0679569 -0.123789 -0.0331086 0.9894251</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"32\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0002181 -0.120029 0.0066789 0.9927479</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"33\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.9894826 0.0129582 -0.124932 -0.0717511</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"35\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.309636 0.0263086 0.6179729 0.7221793</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"36\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0015235 -0.300488 -0.27369 0.913673</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"37\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0072224 0.0653307 0.0231323 0.9975694</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"38\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0181525 -0.0570375 0.0361004 0.997554</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"40\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0122624 -0.0185438 -0.1774731 0.9838745</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"41\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0138668 -0.109433 0.0918681 0.9896425</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"42\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0450705 -0.135004 -0.0143146 0.9897159</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"43\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0061285 -0.13143 0.014798 0.9911961</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"45\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0049722 -0.0220732 0.130833 0.9911462</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"46\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.103847 -0.135952 -0.0679925 0.9829089</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"47\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.9748586 0.0007823 -0.2192859 0.0395439</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"48\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0224361 0.036849 -0.0203456 0.9988618</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"50\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0037494 -0.0049868 -0.0853324 0.996333</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"51\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0070436 -0.14932 -0.0004116 0.9887637</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"52\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0 0 0 1</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"53\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.974819 0.0117887 -0.222167 -0.0151935</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"55\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.538788 0.43857 0.597878 -0.399882</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"56\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.6909311 -0.15478 -0.128294 0.6944048</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"57\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0101834 0.038481 -0.0018027 0.9992058</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"58\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0203803 0.0415852 -0.0630569 0.9969349</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"59\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0044506 -0.0094366 -0.0140891 0.9998463</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"60\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0 0.011735 -0.0095503 0.9998855</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"61\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0029895 -0.0047437 -0.0195011 0.9997941</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"62\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0680074 -0.122001 0.0321626 0.9896749</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"63\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0002196 -0.120029 -0.0066788 0.9927479</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"64\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.9894828 -0.0129583 -0.124931 0.0717507</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"66\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.3096371 0.0263083 -0.6179731 0.7221787</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"67\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0015243 -0.300487 0.273691 0.9136731</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"68\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0072224 0.0653307 -0.0231322 0.9975694</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"69\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0181526 -0.0570375 -0.0361004 0.997554</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"71\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0125795 -0.0197507 0.1744161 0.9843936</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"72\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0140534 -0.108134 -0.0888224 0.9900607</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"73\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0450717 -0.135004 0.0143142 0.9897159</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"74\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0061269 -0.13143 -0.0147976 0.9911961</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"76\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0046217 -0.0239785 -0.128684 0.9913849</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"77\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.103962 -0.133843 0.0660434 0.983319</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"78\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.9748586 -0.0007822 -0.2192859 -0.0395442</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"79\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.0224353 0.036849 0.0203456 0.9988618</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"81\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0036665 -0.0058296 0.0843159 0.9964153</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"82\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>-0.017442 -0.0951774 -0.0303226 0.9948455</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"83\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.0070438 -0.14932 0.0004116 0.9887637</ROTATION> </KEYFRAME> </TRACK> <TRACK BONEID=\"84\" NUMKEYFRAMES=\"1\"> <KEYFRAME TIME=\"0\"> <ROTATION>0.9969375 -0.0074213 -0.0741999 0.0235577</ROTATION> </KEYFRAME> </TRACK> </ANIMATION> ";
         IMVUBall = new Sphere();
         MAPBall = new Sphere();
         LookAtNode = new DisplayObject3D();
         Ground = new Plane(bitmapAssetMat,604,268,5,5);
         Ground.name = "Ground";
         ROTGround = new DisplayObject3D();
         ROTGround.name = "ROTGround";
         ROTByBone(ROTGround,"-0.707 0 0 -0.707");
         matYellow = new ColorMaterial(16747520,0.9);
         matYellow.doubleSided = true;
         matYellow.interactive = true;
         matPink = new ColorMaterial(16738740,0.9);
         matPink.doubleSided = true;
         matPink.interactive = true;
         matPurple = new ColorMaterial(10494192,0.9);
         matPurple.doubleSided = true;
         matPurple.interactive = true;
         gizmoX = new Cylinder(matYellow,100,30,20,1);
         gizmoY = new Cylinder(matPink,120,30,20,1);
         gizmoZ = new Cylinder(matPurple,80,30,20,1);
         gizmo = new DisplayObject3D();
         MyRoot = new DisplayObject3D();
         PelvisNode = new Cube(ml,50,30,20);
         PelvisNode.name = "PelvisNode";
         ROTPelvisNode = new DisplayObject3D();
         ROTPelvisNode.name = "ROTPelvisNode";
         lfHip = new Cube(m2,L_lfHip - 2,30,30);
         lfHip.name = "lfHip";
         ROTlfHip = new DisplayObject3D();
         ROTlfHip.name = "ROTlfHip";
         lfThigh = new Cube(m2,L_lfThigh - 2,30,30);
         lfThigh.name = "lfThigh";
         ROTlfThigh = new DisplayObject3D();
         ROTlfThigh.name = "ROTlfThigh";
         lfCalf = new Cube(m2,L_lfCalf - 2,30,30);
         lfCalf.name = "lfCalf";
         ROTlfCalf = new DisplayObject3D();
         ROTlfCalf.name = "ROTlfCalf";
         lfFoot = new Cube(m2,L_lfFoot - 2,30,30);
         lfFoot.name = "lfFoot";
         ROTlfFoot = new DisplayObject3D();
         ROTlfFoot.name = "ROTlfFoot";
         lfToes = new Cube(m2,L_lfToes - 2,30,30);
         lfToes.name = "lfToes";
         ROTlfToes = new DisplayObject3D();
         ROTlfToes.name = "ROTlfToes";
         rtHip = new Cube(m2,L_rtHip - 2,30,30);
         rtHip.name = "rtHip";
         ROTrtHip = new DisplayObject3D();
         ROTrtHip.name = "ROTrtHip";
         rtThigh = new Cube(m2,L_rtThigh - 2,30,30);
         rtThigh.name = "rtThigh";
         ROTrtThigh = new DisplayObject3D();
         ROTrtThigh.name = "ROTrtThigh";
         rtCalf = new Cube(m2,L_rtCalf - 2,30,30);
         rtCalf.name = "rtCalf";
         ROTrtCalf = new DisplayObject3D();
         ROTrtCalf.name = "ROTrtCalf";
         rtFoot = new Cube(m2,L_rtFoot - 2,30,30);
         rtFoot.name = "rtFoot";
         ROTrtFoot = new DisplayObject3D();
         ROTrtFoot.name = "ROTrtFoot";
         rtToes = new Cube(m2,L_rtToes - 2,30,30);
         rtToes.name = "rtToes";
         ROTrtToes = new DisplayObject3D();
         ROTrtToes.name = "ROTrtToes";
         Spine01 = new Cube(m2,L_Spine01 - 2,30,30);
         Spine01.name = "Spine01";
         ROTSpine01 = new DisplayObject3D();
         ROTSpine01.name = "ROTSpine01";
         Spine02 = new Cube(m2,L_Spine02 - 2,30,30);
         Spine02.name = "Spine02";
         ROTSpine02 = new DisplayObject3D();
         ROTSpine02.name = "ROTSpine02";
         Spine03 = new Cube(m2,L_Spine03 - 2,30,30);
         Spine03.name = "Spine03";
         ROTSpine03 = new DisplayObject3D();
         ROTSpine03.name = "ROTSpine03";
         Spine04 = new Cube(m2,L_Spine04 - 2,30,30);
         Spine04.name = "Spine04";
         ROTSpine04 = new DisplayObject3D();
         ROTSpine04.name = "ROTSpine04";
         Neck01 = new Cube(m2,L_Neck01 - 2,30,30);
         Neck01.name = "Neck01";
         ROTNeck01 = new DisplayObject3D();
         ROTNeck01.name = "ROTNeck01";
         Neck02 = new Cube(m2,L_Neck02 - 2,30,30);
         Neck02.name = "Neck02";
         ROTNeck02 = new DisplayObject3D();
         ROTNeck02.name = "ROTNeck02";
         Neck03 = new Cube(m2,L_Neck03 - 2,30,30);
         Neck03.name = "Neck03";
         ROTNeck03 = new DisplayObject3D();
         ROTNeck03.name = "ROTNeck03";
         Neck04 = new Cube(m2,L_Neck04 - 2,30,30);
         Neck04.name = "Neck04";
         ROTNeck04 = new DisplayObject3D();
         ROTNeck04.name = "ROTNeck04";
         Head = new Sphere(flatShaderMat,70);
         Head.name = "Head";
         ROTHead = new DisplayObject3D();
         ROTHead.name = "ROTHead";
         lfClavicle = new Cube(m2,L_lfClavicle - 2,30,30);
         lfClavicle.name = "lfClavicle";
         ROTlfClavicle = new DisplayObject3D();
         ROTlfClavicle.name = "ROTlfClavicle";
         lfShoulder = new Cube(m2,L_lfShoulder - 2,30,30);
         lfShoulder.name = "lfShoulder";
         ROTlfShoulder = new DisplayObject3D();
         ROTlfShoulder.name = "ROTlfShoulder";
         lfbicep = new Cube(m2,L_lfbicep - 2,30,30);
         lfbicep.name = "lfbicep";
         ROTlfbicep = new DisplayObject3D();
         ROTlfbicep.name = "ROTlfbicep";
         lfElbow = new Cube(m2,L_lfElbow - 2,30,30);
         lfElbow.name = "lfElbow";
         ROTlfElbow = new DisplayObject3D();
         ROTlfElbow.name = "ROTlfElbow";
         lfWrist = new Cube(m2,L_lfWrist - 2,30,30);
         lfWrist.name = "lfWrist";
         ROTlfWrist = new DisplayObject3D();
         ROTlfWrist.name = "ROTlfWrist";
         lfHand = new Cube(m2,L_lfHand - 2,30,30);
         lfHand.name = "lfHand";
         ROTlfHand = new DisplayObject3D();
         ROTlfHand.name = "ROTlfHand";
         lfmetaCarpal03 = new Cube(m2,L_lfmetaCarpal03 - 2,20,20);
         lfmetaCarpal03.name = "lfmetaCarpal03";
         ROTlfmetaCarpal03 = new DisplayObject3D();
         ROTlfmetaCarpal03.name = "ROTlfmetaCarpal03";
         lfFingerMiddle01 = new Cube(m2,L_lfFingerMiddle01 - 2,15,15);
         lfFingerMiddle01.name = "lfFingerMiddle01";
         ROTlfFingerMiddle01 = new DisplayObject3D();
         ROTlfFingerMiddle01.name = "ROTlfFingerMiddle01";
         lfFingerMiddle02 = new Cube(m2,L_lfFingerMiddle02 - 2,15,15);
         lfFingerMiddle02.name = "lfFingerMiddle02";
         ROTlfFingerMiddle02 = new DisplayObject3D();
         ROTlfFingerMiddle02.name = "ROTlfFingerMiddle02";
         lfFingerMiddle03 = new Cube(m2,L_lfFingerMiddle03 - 2,15,15);
         lfFingerMiddle03.name = "lfFingerMiddle03";
         ROTlfFingerMiddle03 = new DisplayObject3D();
         ROTlfFingerMiddle03.name = "ROTlfFingerMiddle03";
         lfmetaCarpal01 = new Cube(m2,L_lfmetaCarpal01 - 2,20,20);
         lfmetaCarpal01.name = "lfmetaCarpal01";
         ROTlfmetaCarpal01 = new DisplayObject3D();
         ROTlfmetaCarpal01.name = "ROTlfmetaCarpal01";
         lfThumb01d = new Cube(m2,L_lfThumb01d - 2,20,20);
         lfThumb01d.name = "lfThumb01d";
         ROTlfThumb01d = new DisplayObject3D();
         ROTlfThumb01d.name = "ROTlfThumb01d";
         lfThumb02 = new Cube(m2,L_lfThumb02 - 2,20,20);
         lfThumb02.name = "lfThumb02";
         ROTlfThumb02 = new DisplayObject3D();
         ROTlfThumb02.name = "ROTlfThumb02";
         lfThumb03 = new Cube(m2,L_lfThumb03 - 2,20,20);
         lfThumb03.name = "lfThumb03";
         ROTlfThumb03 = new DisplayObject3D();
         ROTlfThumb03.name = "ROTlfThumb03";
         lfmetaCarpal05 = new Cube(m2,L_lfmetaCarpal05 - 2,20,20);
         lfmetaCarpal05.name = "lfmetaCarpal05";
         ROTlfmetaCarpal05 = new DisplayObject3D();
         ROTlfmetaCarpal05.name = "ROTlfmetaCarpal05";
         lfFingerPinky01 = new Cube(m2,L_lfFingerPinky01 - 2,15,15);
         lfFingerPinky01.name = "lfFingerPinky01";
         ROTlfFingerPinky01 = new DisplayObject3D();
         ROTlfFingerPinky01.name = "ROTlfFingerPinky01";
         lfFingerPinky02 = new Cube(m2,L_lfFingerPinky02 - 2,15,15);
         lfFingerPinky02.name = "lfFingerPinky02";
         ROTlfFingerPinky02 = new DisplayObject3D();
         ROTlfFingerPinky02.name = "ROTlfFingerPinky02";
         lfFingerPinky03 = new Cube(m2,L_lfFingerPinky03 - 2,15,15);
         lfFingerPinky03.name = "lfFingerPinky03";
         ROTlfFingerPinky03 = new DisplayObject3D();
         ROTlfFingerPinky03.name = "ROTlfFingerPinky03";
         lfmetaCarpal02 = new Cube(m2,L_lfmetaCarpal02 - 2,20,20);
         lfmetaCarpal02.name = "lfmetaCarpal02";
         ROTlfmetaCarpal02 = new DisplayObject3D();
         ROTlfmetaCarpal02.name = "ROTlfmetaCarpal02";
         lfFingerIndex01 = new Cube(m2,L_lfFingerIndex01 - 2,15,15);
         lfFingerIndex01.name = "lfFingerIndex01";
         ROTlfFingerIndex01 = new DisplayObject3D();
         ROTlfFingerIndex01.name = "ROTlfFingerIndex01";
         lfFingerIndex02 = new Cube(m2,L_lfFingerIndex02 - 2,15,15);
         lfFingerIndex02.name = "lfFingerIndex02";
         ROTlfFingerIndex02 = new DisplayObject3D();
         ROTlfFingerIndex02.name = "ROTlfFingerIndex02";
         lfFingerIndex03 = new Cube(m2,L_lfFingerIndex03 - 2,15,15);
         lfFingerIndex03.name = "lfFingerIndex03";
         ROTlfFingerIndex03 = new DisplayObject3D();
         ROTlfFingerIndex03.name = "ROTlfFingerIndex03";
         lfmetaCarpal04 = new Cube(m2,L_lfmetaCarpal04 - 2,20,20);
         lfmetaCarpal04.name = "lfmetaCarpal04";
         ROTlfmetaCarpal04 = new DisplayObject3D();
         ROTlfmetaCarpal04.name = "ROTlfmetaCarpal04";
         lfFingerRing01 = new Cube(m2,L_lfFingerRing01 - 2,15,15);
         lfFingerRing01.name = "lfFingerRing01";
         ROTlfFingerRing01 = new DisplayObject3D();
         ROTlfFingerRing01.name = "ROTlfFingerRing01";
         lfFingerRing02 = new Cube(m2,L_lfFingerRing02 - 2,15,15);
         lfFingerRing02.name = "lfFingerRing02";
         ROTlfFingerRing02 = new DisplayObject3D();
         ROTlfFingerRing02.name = "ROTlfFingerRing02";
         lfFingerRing03 = new Cube(m2,L_lfFingerRing03 - 2,15,15);
         lfFingerRing03.name = "lfFingerRing03";
         ROTlfFingerRing03 = new DisplayObject3D();
         ROTlfFingerRing03.name = "ROTlfFingerRing03";
         rtClavicle = new Cube(m2,L_rtClavicle - 2,30,30);
         rtClavicle.name = "rtClavicle";
         ROTrtClavicle = new DisplayObject3D();
         ROTrtClavicle.name = "ROTrtClavicle";
         rtShoulder = new Cube(m2,L_rtShoulder - 2,30,30);
         rtShoulder.name = "rtShoulder";
         ROTrtShoulder = new DisplayObject3D();
         ROTrtShoulder.name = "ROTrtShoulder";
         rtBicep = new Cube(m2,L_rtBicep - 2,30,30);
         rtBicep.name = "rtBicep";
         ROTrtBicep = new DisplayObject3D();
         ROTrtBicep.name = "ROTrtBicep";
         rtElbow = new Cube(m2,L_rtElbow - 2,30,30);
         rtElbow.name = "rtElbow";
         ROTrtElbow = new DisplayObject3D();
         ROTrtElbow.name = "ROTrtElbow";
         rtWrist = new Cube(m2,L_rtWrist - 2,30,30);
         rtWrist.name = "rtWrist";
         ROTrtWrist = new DisplayObject3D();
         ROTrtWrist.name = "ROTrtWrist";
         rtHand = new Cube(m2,L_rtHand - 2,30,30);
         rtHand.name = "rtHand";
         ROTrtHand = new DisplayObject3D();
         ROTrtHand.name = "ROTrtHand";
         rtmetaCarpal03 = new Cube(m2,L_rtmetaCarpal03 - 2,20,20);
         rtmetaCarpal03.name = "rtmetaCarpal03";
         ROTrtmetaCarpal03 = new DisplayObject3D();
         ROTrtmetaCarpal03.name = "ROTrtmetaCarpal03";
         rtFingerMiddle01 = new Cube(m2,L_rtFingerMiddle01 - 2,15,15);
         rtFingerMiddle01.name = "rtFingerMiddle01";
         ROTrtFingerMiddle01 = new DisplayObject3D();
         ROTrtFingerMiddle01.name = "ROTrtFingerMiddle01";
         rtFingerMiddle02 = new Cube(m2,L_rtFingerMiddle02 - 2,15,15);
         rtFingerMiddle02.name = "rtFingerMiddle02";
         ROTrtFingerMiddle02 = new DisplayObject3D();
         ROTrtFingerMiddle02.name = "ROTrtFingerMiddle02";
         rtFingerMiddle03 = new Cube(m2,L_rtFingerMiddle03 - 2,15,15);
         rtFingerMiddle03.name = "rtFingerMiddle03";
         ROTrtFingerMiddle03 = new DisplayObject3D();
         ROTrtFingerMiddle03.name = "ROTrtFingerMiddle03";
         rtmetaCarpal01 = new Cube(m2,L_rtmetaCarpal01 - 2,20,20);
         rtmetaCarpal01.name = "rtmetaCarpal01";
         ROTrtmetaCarpal01 = new DisplayObject3D();
         ROTrtmetaCarpal01.name = "ROTrtmetaCarpal01";
         rtThumb01 = new Cube(m2,L_rtThumb01 - 2,20,20);
         rtThumb01.name = "rtThumb01";
         ROTrtThumb01 = new DisplayObject3D();
         ROTrtThumb01.name = "ROTrtThumb01";
         rtThumb02 = new Cube(m2,L_rtThumb02 - 2,20,20);
         rtThumb02.name = "rtThumb02";
         ROTrtThumb02 = new DisplayObject3D();
         ROTrtThumb02.name = "ROTrtThumb02";
         rtThumb03 = new Cube(m2,L_rtThumb03 - 2,20,20);
         rtThumb03.name = "rtThumb03";
         ROTrtThumb03 = new DisplayObject3D();
         ROTrtThumb03.name = "ROTrtThumb03";
         rtmetaCarpal05 = new Cube(m2,L_rtmetaCarpal05 - 2,20,20);
         rtmetaCarpal05.name = "rtmetaCarpal05";
         ROTrtmetaCarpal05 = new DisplayObject3D();
         ROTrtmetaCarpal05.name = "ROTrtmetaCarpal05";
         rtFingerPinky01 = new Cube(m2,L_rtFingerPinky01 - 2,15,15);
         rtFingerPinky01.name = "rtFingerPinky01";
         ROTrtFingerPinky01 = new DisplayObject3D();
         ROTrtFingerPinky01.name = "ROTrtFingerPinky01";
         rtFingerPinky02 = new Cube(m2,L_rtFingerPinky02 - 2,15,15);
         rtFingerPinky02.name = "rtFingerPinky02";
         ROTrtFingerPinky02 = new DisplayObject3D();
         ROTrtFingerPinky02.name = "ROTrtFingerPinky02";
         rtFingerPinky03 = new Cube(m2,L_rtFingerPinky03 - 2,15,15);
         rtFingerPinky03.name = "rtFingerPinky03";
         ROTrtFingerPinky03 = new DisplayObject3D();
         ROTrtFingerPinky03.name = "ROTrtFingerPinky03";
         rtmetaCarpal02 = new Cube(m2,L_rtmetaCarpal02 - 2,20,20);
         rtmetaCarpal02.name = "rtmetaCarpal02";
         ROTrtmetaCarpal02 = new DisplayObject3D();
         ROTrtmetaCarpal02.name = "ROTrtmetaCarpal02";
         rtFingerIndex01 = new Cube(m2,L_rtFingerIndex01 - 2,15,15);
         rtFingerIndex01.name = "rtFingerIndex01";
         ROTrtFingerIndex01 = new DisplayObject3D();
         ROTrtFingerIndex01.name = "ROTrtFingerIndex01";
         rtFingerIndex02 = new Cube(m2,L_rtFingerIndex02 - 2,15,15);
         rtFingerIndex02.name = "rtFingerIndex02";
         ROTrtFingerIndex02 = new DisplayObject3D();
         ROTrtFingerIndex02.name = "ROTrtFingerIndex02";
         rtFingerIndex03 = new Cube(m2,L_rtFingerIndex03 - 2,15,15);
         rtFingerIndex03.name = "rtFingerIndex03";
         ROTrtFingerIndex03 = new DisplayObject3D();
         ROTrtFingerIndex03.name = "ROTrtFingerIndex03";
         rtmetaCarpal04 = new Cube(m2,L_rtmetaCarpal04 - 2,20,20);
         rtmetaCarpal04.name = "rtmetaCarpal04";
         ROTrtmetaCarpal04 = new DisplayObject3D();
         ROTrtmetaCarpal04.name = "ROTrtmetaCarpal04";
         rtFingerRing01 = new Cube(m2,L_rtFingerRing01 - 2,15,15);
         rtFingerRing01.name = "rtFingerRing01";
         ROTrtFingerRing01 = new DisplayObject3D();
         ROTrtFingerRing01.name = "ROTrtFingerRing01";
         rtFingerRing02 = new Cube(m2,L_rtFingerRing02 - 2,15,15);
         rtFingerRing02.name = "rtFingerRing02";
         ROTrtFingerRing02 = new DisplayObject3D();
         ROTrtFingerRing02.name = "ROTrtFingerRing02";
         rtFingerRing03 = new Cube(m2,L_rtFingerRing03 - 2,15,15);
         rtFingerRing03.name = "rtFingerRing03";
         ROTrtFingerRing03 = new DisplayObject3D();
         ROTrtFingerRing03.name = "ROTrtFingerRing03";
         LeftEye = new Cube(ml,15,2,15);
         RightEye = new Cube(ml,15,2,15);
         scene.addChild(MyRoot);
         PelvisNode.addChild(gizmo);
         gizmo.addChild(gizmoX);
         gizmo.addChild(gizmoY);
         gizmo.addChild(gizmoZ);
         gizmo.transform.copy3x3(PelvisNode.transform);
         MyRoot.addChild(ROTGround);
         ROTGround.addChild(Ground);
         MyRoot.addChild(ROTPelvisNode);
         MyRoot.addChild(LookAtNode);
         LookAtNode.y = -110;
         camera.lookAt(LookAtNode);
         ROTPelvisNode.addChild(ROTlfHip);
         ROTPelvisNode.addChild(ROTrtHip);
         ROTPelvisNode.addChild(ROTSpine01);
         ROTPelvisNode.addChild(PelvisNode);
         ROTlfHip.addChild(lfHip);
         ROTlfThigh.addChild(lfThigh);
         ROTlfCalf.addChild(lfCalf);
         ROTlfFoot.addChild(lfFoot);
         ROTlfToes.addChild(lfToes);
         ROTrtHip.addChild(rtHip);
         ROTrtThigh.addChild(rtThigh);
         ROTrtCalf.addChild(rtCalf);
         ROTrtFoot.addChild(rtFoot);
         ROTrtToes.addChild(rtToes);
         ROTSpine01.addChild(Spine01);
         ROTSpine02.addChild(Spine02);
         ROTSpine03.addChild(Spine03);
         ROTSpine04.addChild(Spine04);
         ROTNeck01.addChild(Neck01);
         ROTNeck02.addChild(Neck02);
         ROTNeck03.addChild(Neck03);
         ROTNeck04.addChild(Neck04);
         ROTHead.addChild(Head);
         ROTHead.addChild(LeftEye);
         ROTHead.addChild(RightEye);
         ROTlfClavicle.addChild(lfClavicle);
         ROTlfShoulder.addChild(lfShoulder);
         ROTlfbicep.addChild(lfbicep);
         ROTlfElbow.addChild(lfElbow);
         ROTlfWrist.addChild(lfWrist);
         ROTlfHand.addChild(lfHand);
         ROTlfmetaCarpal03.addChild(lfmetaCarpal03);
         ROTlfFingerMiddle01.addChild(lfFingerMiddle01);
         ROTlfFingerMiddle02.addChild(lfFingerMiddle02);
         ROTlfFingerMiddle03.addChild(lfFingerMiddle03);
         ROTlfmetaCarpal01.addChild(lfmetaCarpal01);
         ROTlfThumb01d.addChild(lfThumb01d);
         ROTlfThumb02.addChild(lfThumb02);
         ROTlfThumb03.addChild(lfThumb03);
         ROTlfmetaCarpal05.addChild(lfmetaCarpal05);
         ROTlfFingerPinky01.addChild(lfFingerPinky01);
         ROTlfFingerPinky02.addChild(lfFingerPinky02);
         ROTlfFingerPinky03.addChild(lfFingerPinky03);
         ROTlfmetaCarpal02.addChild(lfmetaCarpal02);
         ROTlfFingerIndex01.addChild(lfFingerIndex01);
         ROTlfFingerIndex02.addChild(lfFingerIndex02);
         ROTlfFingerIndex03.addChild(lfFingerIndex03);
         ROTlfmetaCarpal04.addChild(lfmetaCarpal04);
         ROTlfFingerRing01.addChild(lfFingerRing01);
         ROTlfFingerRing02.addChild(lfFingerRing02);
         ROTlfFingerRing03.addChild(lfFingerRing03);
         ROTrtClavicle.addChild(rtClavicle);
         ROTrtShoulder.addChild(rtShoulder);
         ROTrtBicep.addChild(rtBicep);
         ROTrtElbow.addChild(rtElbow);
         ROTrtWrist.addChild(rtWrist);
         ROTrtHand.addChild(rtHand);
         ROTrtmetaCarpal03.addChild(rtmetaCarpal03);
         ROTrtFingerMiddle01.addChild(rtFingerMiddle01);
         ROTrtFingerMiddle02.addChild(rtFingerMiddle02);
         ROTrtFingerMiddle03.addChild(rtFingerMiddle03);
         ROTrtmetaCarpal01.addChild(rtmetaCarpal01);
         ROTrtThumb01.addChild(rtThumb01);
         ROTrtThumb02.addChild(rtThumb02);
         ROTrtThumb03.addChild(rtThumb03);
         ROTrtmetaCarpal05.addChild(rtmetaCarpal05);
         ROTrtFingerPinky01.addChild(rtFingerPinky01);
         ROTrtFingerPinky02.addChild(rtFingerPinky02);
         ROTrtFingerPinky03.addChild(rtFingerPinky03);
         ROTrtmetaCarpal02.addChild(rtmetaCarpal02);
         ROTrtFingerIndex01.addChild(rtFingerIndex01);
         ROTrtFingerIndex02.addChild(rtFingerIndex02);
         ROTrtFingerIndex03.addChild(rtFingerIndex03);
         ROTrtmetaCarpal04.addChild(rtmetaCarpal04);
         ROTrtFingerRing01.addChild(rtFingerRing01);
         ROTrtFingerRing02.addChild(rtFingerRing02);
         ROTrtFingerRing03.addChild(rtFingerRing03);
         ROTlfHip.addChild(ROTlfThigh);
         ROTlfThigh.addChild(ROTlfCalf);
         ROTlfCalf.addChild(ROTlfFoot);
         ROTlfFoot.addChild(ROTlfToes);
         ROTrtHip.addChild(ROTrtThigh);
         ROTrtThigh.addChild(ROTrtCalf);
         ROTrtCalf.addChild(ROTrtFoot);
         ROTrtFoot.addChild(ROTrtToes);
         ROTSpine01.addChild(ROTSpine02);
         ROTSpine02.addChild(ROTSpine03);
         ROTSpine03.addChild(ROTSpine04);
         ROTSpine04.addChild(ROTNeck01);
         ROTSpine04.addChild(ROTlfClavicle);
         ROTSpine04.addChild(ROTrtClavicle);
         ROTNeck01.addChild(ROTNeck02);
         ROTNeck02.addChild(ROTNeck03);
         ROTNeck03.addChild(ROTNeck04);
         ROTNeck04.addChild(ROTHead);
         ROTlfClavicle.addChild(ROTlfShoulder);
         ROTlfShoulder.addChild(ROTlfbicep);
         ROTlfbicep.addChild(ROTlfElbow);
         ROTlfElbow.addChild(ROTlfWrist);
         ROTlfWrist.addChild(ROTlfHand);
         ROTlfHand.addChild(ROTlfmetaCarpal03);
         ROTlfHand.addChild(ROTlfmetaCarpal01);
         ROTlfHand.addChild(ROTlfmetaCarpal05);
         ROTlfHand.addChild(ROTlfmetaCarpal02);
         ROTlfHand.addChild(ROTlfmetaCarpal04);
         ROTlfmetaCarpal03.addChild(ROTlfFingerMiddle01);
         ROTlfFingerMiddle01.addChild(ROTlfFingerMiddle02);
         ROTlfFingerMiddle02.addChild(ROTlfFingerMiddle03);
         ROTlfmetaCarpal01.addChild(ROTlfThumb01d);
         ROTlfThumb01d.addChild(ROTlfThumb02);
         ROTlfThumb02.addChild(ROTlfThumb03);
         ROTlfmetaCarpal05.addChild(ROTlfFingerPinky01);
         ROTlfFingerPinky01.addChild(ROTlfFingerPinky02);
         ROTlfFingerPinky02.addChild(ROTlfFingerPinky03);
         ROTlfmetaCarpal02.addChild(ROTlfFingerIndex01);
         ROTlfFingerIndex01.addChild(ROTlfFingerIndex02);
         ROTlfFingerIndex02.addChild(ROTlfFingerIndex03);
         ROTlfmetaCarpal04.addChild(ROTlfFingerRing01);
         ROTlfFingerRing01.addChild(ROTlfFingerRing02);
         ROTlfFingerRing02.addChild(ROTlfFingerRing03);
         ROTrtClavicle.addChild(ROTrtShoulder);
         ROTrtShoulder.addChild(ROTrtBicep);
         ROTrtBicep.addChild(ROTrtElbow);
         ROTrtElbow.addChild(ROTrtWrist);
         ROTrtWrist.addChild(ROTrtHand);
         ROTrtHand.addChild(ROTrtmetaCarpal03);
         ROTrtHand.addChild(ROTrtmetaCarpal01);
         ROTrtHand.addChild(ROTrtmetaCarpal05);
         ROTrtHand.addChild(ROTrtmetaCarpal02);
         ROTrtHand.addChild(ROTrtmetaCarpal04);
         ROTrtmetaCarpal03.addChild(ROTrtFingerMiddle01);
         ROTrtFingerMiddle01.addChild(ROTrtFingerMiddle02);
         ROTrtFingerMiddle02.addChild(ROTrtFingerMiddle03);
         ROTrtmetaCarpal01.addChild(ROTrtThumb01);
         ROTrtThumb01.addChild(ROTrtThumb02);
         ROTrtThumb02.addChild(ROTrtThumb03);
         ROTrtmetaCarpal05.addChild(ROTrtFingerPinky01);
         ROTrtFingerPinky01.addChild(ROTrtFingerPinky02);
         ROTrtFingerPinky02.addChild(ROTrtFingerPinky03);
         ROTrtmetaCarpal02.addChild(ROTrtFingerIndex01);
         ROTrtFingerIndex01.addChild(ROTrtFingerIndex02);
         ROTrtFingerIndex02.addChild(ROTrtFingerIndex03);
         ROTrtmetaCarpal04.addChild(ROTrtFingerRing01);
         ROTrtFingerRing01.addChild(ROTrtFingerRing02);
         ROTrtFingerRing02.addChild(ROTrtFingerRing03);
         gizmoX.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,doGizmoX);
         gizmoY.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,doGizmoY);
         gizmoZ.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,doGizmoZ);
         gizmoX.addEventListener(InteractiveScene3DEvent.OBJECT_RELEASE,doGizmoRelease);
         gizmoY.addEventListener(InteractiveScene3DEvent.OBJECT_RELEASE,doGizmoRelease);
         gizmoZ.addEventListener(InteractiveScene3DEvent.OBJECT_RELEASE,doGizmoRelease);
         PelvisNode.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfHip.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfThigh.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfCalf.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfFoot.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfToes.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtHip.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtThigh.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtCalf.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtFoot.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtToes.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         Spine01.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         Spine02.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         Spine03.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         Spine04.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         Neck01.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         Neck02.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         Neck03.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         Neck04.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         Head.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfClavicle.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfShoulder.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfbicep.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfElbow.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfWrist.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfHand.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfmetaCarpal03.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfFingerMiddle01.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfFingerMiddle02.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfFingerMiddle03.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfmetaCarpal01.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfThumb01d.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfThumb02.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfThumb03.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfmetaCarpal05.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfFingerPinky01.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfFingerPinky02.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfFingerPinky03.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfmetaCarpal02.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfFingerIndex01.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfFingerIndex02.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfFingerIndex03.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfmetaCarpal04.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfFingerRing01.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfFingerRing02.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         lfFingerRing03.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtClavicle.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtShoulder.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtBicep.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtElbow.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtWrist.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtHand.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtmetaCarpal03.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtFingerMiddle01.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtFingerMiddle02.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtFingerMiddle03.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtmetaCarpal01.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtThumb01.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtThumb02.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtThumb03.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtmetaCarpal05.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtFingerPinky01.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtFingerPinky02.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtFingerPinky03.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtmetaCarpal02.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtFingerIndex01.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtFingerIndex02.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtFingerIndex03.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtmetaCarpal04.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtFingerRing01.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtFingerRing02.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         rtFingerRing03.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         Ground.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,onBone);
         myDropDown.addEventListener(Event.CHANGE,setThingy);
         btnThingy.addEventListener(MouseEvent.CLICK,thingyToggle);
         myLabels = new Array("Ball & socket","Pivot","Hinge Y","Hinge Z","Saddle","Fixed");
         i = 0;
         while(i < myLabels.length)
         {
            myDropDown.addItem({
               "label":myLabels[i],
               "data":""
            });
            i++;
         }
         myDropDown.selectedIndex = 0;
         btnResetBone.addEventListener(MouseEvent.CLICK,doBtnResetBone);
         GetXAF.addEventListener(MouseEvent.CLICK,doGetXAF);
         LoadXAF.addEventListener(MouseEvent.CLICK,doLoadXAF);
         btnResetAll.addEventListener(MouseEvent.CLICK,doResetAll);
         btnResetView.addEventListener(MouseEvent.CLICK,doBtnResetView);
         btnHelp.addEventListener(MouseEvent.CLICK,doBtnHelp);
         controlPlay.addEventListener(MouseEvent.CLICK,doControlPlay);
         controlStop.addEventListener(MouseEvent.CLICK,doControlStop);
         copyDropDown.addEventListener(Event.CHANGE,doCopyDropDown);
         PelvisNode.y = 25;
         PelvisNode.x = 0;
         lfHip.x = L_lfHip / 2;
         lfThigh.x = L_lfThigh / 2;
         lfCalf.x = L_lfCalf / 2;
         lfFoot.x = L_lfFoot / 2;
         lfToes.x = L_lfToes / 2;
         rtHip.x = L_rtHip / 2;
         rtThigh.x = L_rtThigh / 2;
         rtCalf.x = L_rtCalf / 2;
         rtFoot.x = L_rtFoot / 2;
         rtToes.x = L_rtToes / 2;
         Spine01.x = L_Spine01 / 2;
         Spine02.x = L_Spine02 / 2;
         Spine03.x = L_Spine03 / 2;
         Spine04.x = L_Spine04 / 2;
         Neck01.x = L_Neck01 / 2;
         lfClavicle.x = L_lfClavicle / 2;
         rtClavicle.x = L_rtClavicle / 2;
         Neck02.x = L_Neck02 / 2;
         Neck03.x = L_Neck03 / 2;
         Neck04.x = L_Neck04 / 2;
         Head.x = L_Head / 2 + 43;
         lfShoulder.x = L_lfShoulder / 2;
         lfbicep.x = L_lfbicep / 2;
         lfElbow.x = L_lfElbow / 2;
         lfWrist.x = L_lfWrist / 2;
         lfHand.x = L_lfHand / 2;
         lfmetaCarpal03.x = L_lfmetaCarpal03 / 2;
         lfmetaCarpal01.x = L_lfmetaCarpal01 / 2;
         lfmetaCarpal05.x = L_lfmetaCarpal05 / 2;
         lfmetaCarpal02.x = L_lfmetaCarpal02 / 2;
         lfmetaCarpal04.x = L_lfmetaCarpal04 / 2;
         lfFingerMiddle01.x = L_lfFingerMiddle01 / 2;
         lfFingerMiddle02.x = L_lfFingerMiddle02 / 2;
         lfFingerMiddle03.x = L_lfFingerMiddle03 / 2;
         lfThumb01d.x = L_lfThumb01d / 2;
         lfThumb02.x = L_lfThumb02 / 2;
         lfThumb03.x = L_lfThumb03 / 2;
         lfFingerPinky01.x = L_lfFingerPinky01 / 2;
         lfFingerPinky02.x = L_lfFingerPinky02 / 2;
         lfFingerPinky03.x = L_lfFingerPinky03 / 2;
         lfFingerIndex01.x = L_lfFingerIndex01 / 2;
         lfFingerIndex02.x = L_lfFingerIndex02 / 2;
         lfFingerIndex03.x = L_lfFingerIndex03 / 2;
         lfFingerRing01.x = L_lfFingerRing01 / 2;
         lfFingerRing02.x = L_lfFingerRing02 / 2;
         lfFingerRing03.x = L_lfFingerRing03 / 2;
         rtShoulder.x = L_rtShoulder / 2;
         rtBicep.x = L_rtBicep / 2;
         rtElbow.x = L_rtElbow / 2;
         rtWrist.x = L_rtWrist / 2;
         rtHand.x = L_rtHand / 2;
         rtmetaCarpal03.x = L_rtmetaCarpal03 / 2;
         rtmetaCarpal01.x = L_rtmetaCarpal01 / 2;
         rtmetaCarpal05.x = L_rtmetaCarpal05 / 2;
         rtmetaCarpal02.x = L_rtmetaCarpal02 / 2;
         rtmetaCarpal04.x = L_rtmetaCarpal04 / 2;
         rtFingerMiddle01.x = L_rtFingerMiddle01 / 2;
         rtFingerMiddle02.x = L_rtFingerMiddle02 / 2;
         rtFingerMiddle03.x = L_rtFingerMiddle03 / 2;
         rtThumb01.x = L_rtThumb01 / 2;
         rtThumb02.x = L_rtThumb02 / 2;
         rtThumb03.x = L_rtThumb03 / 2;
         rtFingerPinky01.x = L_rtFingerPinky01 / 2;
         rtFingerPinky02.x = L_rtFingerPinky02 / 2;
         rtFingerPinky03.x = L_rtFingerPinky03 / 2;
         rtFingerIndex01.x = L_rtFingerIndex01 / 2;
         rtFingerIndex02.x = L_rtFingerIndex02 / 2;
         rtFingerIndex03.x = L_rtFingerIndex03 / 2;
         rtFingerRing01.x = L_rtFingerRing01 / 2;
         rtFingerRing02.x = L_rtFingerRing02 / 2;
         rtFingerRing03.x = L_rtFingerRing03 / 2;
         LeftEye.x = 70;
         LeftEye.y = 30;
         LeftEye.z = 70;
         RightEye.x = 70;
         RightEye.y = -30;
         RightEye.z = 70;
         ROTlfHip.x = L_PelvisNode;
         ROTlfThigh.x = L_lfHip;
         ROTlfCalf.x = L_lfThigh;
         ROTlfFoot.x = L_lfCalf;
         ROTlfToes.x = L_lfFoot;
         ROTrtHip.x = L_PelvisNode;
         ROTrtThigh.x = L_rtHip;
         ROTrtCalf.x = L_rtThigh;
         ROTrtFoot.x = L_rtCalf;
         ROTrtToes.x = L_rtFoot;
         ROTSpine01.x = L_PelvisNode;
         ROTSpine01.y = 36.157;
         ROTSpine01.visible = true;
         ROTSpine02.x = L_Spine01;
         ROTSpine03.x = L_Spine02;
         ROTSpine04.x = L_Spine03;
         ROTNeck01.x = L_Spine04;
         ROTlfClavicle.x = L_Spine04;
         ROTrtClavicle.x = L_Spine04;
         ROTNeck02.x = L_Neck01;
         ROTNeck03.x = L_Neck02;
         ROTNeck04.x = L_Neck03;
         ROTHead.x = L_Neck04;
         ROTlfShoulder.x = L_lfClavicle;
         ROTlfbicep.x = L_lfShoulder;
         ROTlfElbow.x = L_lfbicep;
         ROTlfWrist.x = L_lfElbow;
         ROTlfHand.x = L_lfWrist;
         ROTlfmetaCarpal03.x = L_lfHand;
         ROTlfmetaCarpal01.x = L_lfHand;
         ROTlfmetaCarpal05.x = L_lfHand;
         ROTlfmetaCarpal02.x = L_lfHand;
         ROTlfmetaCarpal04.x = L_lfHand;
         ROTlfFingerMiddle01.x = L_lfmetaCarpal03;
         ROTlfFingerMiddle02.x = L_lfFingerMiddle01;
         ROTlfFingerMiddle03.x = L_lfFingerMiddle02;
         ROTlfThumb01d.x = L_lfmetaCarpal01;
         ROTlfThumb02.x = L_lfThumb01d;
         ROTlfThumb03.x = L_lfThumb02;
         ROTlfFingerPinky01.x = L_lfmetaCarpal05;
         ROTlfFingerPinky02.x = L_lfFingerPinky01;
         ROTlfFingerPinky03.x = L_lfFingerPinky02;
         ROTlfFingerIndex01.x = L_lfmetaCarpal02;
         ROTlfFingerIndex02.x = L_lfFingerIndex01;
         ROTlfFingerIndex03.x = L_lfFingerIndex02;
         ROTlfFingerRing01.x = L_lfmetaCarpal04;
         ROTlfFingerRing02.x = L_lfFingerRing01;
         ROTlfFingerRing03.x = L_lfFingerRing02;
         ROTrtShoulder.x = L_rtClavicle;
         ROTrtBicep.x = L_rtShoulder;
         ROTrtElbow.x = L_rtBicep;
         ROTrtWrist.x = L_rtElbow;
         ROTrtHand.x = L_rtWrist;
         ROTrtmetaCarpal03.x = L_rtHand;
         ROTrtmetaCarpal01.x = L_rtHand;
         ROTrtmetaCarpal05.x = L_rtHand;
         ROTrtmetaCarpal02.x = L_rtHand;
         ROTrtmetaCarpal04.x = L_rtHand;
         ROTrtFingerMiddle01.x = L_rtmetaCarpal03;
         ROTrtFingerMiddle02.x = L_rtFingerMiddle01;
         ROTrtFingerMiddle03.x = L_rtFingerMiddle02;
         ROTrtThumb01.x = L_rtmetaCarpal01;
         ROTrtThumb02.x = L_rtThumb01;
         ROTrtThumb03.x = L_rtThumb02;
         ROTrtFingerPinky01.x = L_rtmetaCarpal05;
         ROTrtFingerPinky02.x = L_rtFingerPinky01;
         ROTrtFingerPinky03.x = L_rtFingerPinky02;
         ROTrtFingerIndex01.x = L_rtmetaCarpal02;
         ROTrtFingerIndex02.x = L_rtFingerIndex01;
         ROTrtFingerIndex03.x = L_rtFingerIndex02;
         ROTrtFingerRing01.x = L_rtmetaCarpal04;
         ROTrtFingerRing02.x = L_rtFingerRing01;
         ROTrtFingerRing03.x = L_rtFingerRing02;
         addEventListener(Event.ENTER_FRAME,onEnterFrame);
         stage.addEventListener(MouseEvent.MOUSE_DOWN,onStageMouseDown);
         stage.addEventListener(MouseEvent.MOUSE_UP,onStageMouseUp);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,checkKeysDown);
         stage.addEventListener(KeyboardEvent.KEY_UP,checkKeysUp);
         resultColorTransform = new ColorTransform();
         resultColorTransform.color = 10027008;
         originalColorTransform = kf[0].transform.colorTransform;
         keyframeArray[0] = defaultXAF;
         kf[0].transform.colorTransform = resultColorTransform;
         kf[0].emphasized = true;
         aTa.x = -13;
         aTa.y = -13;
         aTa.width = 600;
         aTa.height = 600;
         StartBtn = new Button();
         StartBtn.emphasized = true;
         StartBtn.selected = true;
         StartBtn.width = 150;
         StartBtn.x = 208;
         StartBtn.y = 260;
         StartBtn.label = "Click here to begin";
         addChild(StartBtn);
         StartBtn.addEventListener(MouseEvent.CLICK,wereOn);
         camera.z = 500;
         camera.x = 500;
         __setProp_GetXAF_Scene1_Layer1_1();
         __setProp_btnResetBone_Scene1_Layer1_1();
         __setProp_controlStop_Scene1_Layer1_1();
         __setProp_btnHelp_Scene1_Layer1_1();
         __setProp_btnBoneZoom_Scene1_Layer1_1();
         __setProp_BoneName_Scene1_Layer1_1();
         __setProp___id7__Scene1_Layer1_1();
         __setProp_keyframeBox_Scene1_Layer1_1();
         __setProp_durationStepper_Scene1_Layer1_1();
         __setProp_copyDropDown_Scene1_Layer1_1();
         __setProp_btnThingy_Scene1_Layer1_1();
         __setProp___id4__Scene1_Layer1_1();
         __setProp_btnResetAll_Scene1_Layer1_1();
         __setProp_btnResetView_Scene1_Layer1_1();
         __setProp_controlPlay_Scene1_Layer1_1();
         __setProp___id6__Scene1_Layer1_1();
         __setProp_LoadXAF_Scene1_Layer1_1();
         __setProp___id5__Scene1_Layer1_1();
      }
      
      internal function __setProp_btnThingy_Scene1_Layer1_1() : *
      {
         try
         {
            btnThingy["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         btnThingy.emphasized = false;
         btnThingy.enabled = true;
         btnThingy.label = "Thingy";
         btnThingy.labelPlacement = "right";
         btnThingy.selected = false;
         btnThingy.toggle = true;
         btnThingy.visible = true;
         try
         {
            btnThingy["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp_GetXAF_Scene1_Layer1_1() : *
      {
         try
         {
            GetXAF["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         GetXAF.emphasized = false;
         GetXAF.enabled = true;
         GetXAF.label = "Save";
         GetXAF.labelPlacement = "right";
         GetXAF.selected = false;
         GetXAF.toggle = false;
         GetXAF.visible = true;
         try
         {
            GetXAF["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp_keyframeBox_Scene1_Layer1_1() : *
      {
         try
         {
            keyframeBox["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         keyframeBox.condenseWhite = true;
         keyframeBox.editable = false;
         keyframeBox.enabled = true;
         keyframeBox.horizontalScrollPolicy = "off";
         keyframeBox.htmlText = "";
         keyframeBox.maxChars = 0;
         keyframeBox.restrict = "";
         keyframeBox.text = "0";
         keyframeBox.verticalScrollPolicy = "off";
         keyframeBox.visible = true;
         keyframeBox.wordWrap = false;
         try
         {
            keyframeBox["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp_btnResetView_Scene1_Layer1_1() : *
      {
         try
         {
            btnResetView["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         btnResetView.emphasized = false;
         btnResetView.enabled = true;
         btnResetView.label = "Reset view";
         btnResetView.labelPlacement = "right";
         btnResetView.selected = false;
         btnResetView.toggle = false;
         btnResetView.visible = true;
         try
         {
            btnResetView["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp_BoneName_Scene1_Layer1_1() : *
      {
         try
         {
            BoneName["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         BoneName.autoSize = "none";
         BoneName.condenseWhite = false;
         BoneName.enabled = true;
         BoneName.htmlText = "";
         BoneName.selectable = false;
         BoneName.text = "PelvisNode";
         BoneName.visible = true;
         BoneName.wordWrap = false;
         try
         {
            BoneName["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id5__Scene1_Layer1_1() : *
      {
         try
         {
            __id5_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id5_.condenseWhite = false;
         __id5_.editable = false;
         __id5_.enabled = true;
         __id5_.horizontalScrollPolicy = "auto";
         __id5_.htmlText = "";
         __id5_.maxChars = 0;
         __id5_.restrict = "";
         __id5_.text = "";
         __id5_.verticalScrollPolicy = "auto";
         __id5_.visible = true;
         __id5_.wordWrap = true;
         try
         {
            __id5_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp_copyDropDown_Scene1_Layer1_1() : *
      {
         try
         {
            copyDropDown["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         collObj2 = new DataProvider();
         collProps2 = [];
         i2 = 0;
         while(i2 < collProps2.length)
         {
            itemObj2 = new SimpleCollectionItem();
            collProp2 = collProps2[i2];
            for(j2 in collProp2)
            {
               itemObj2[j2] = collProp2[j2];
            }
            collObj2.addItem(itemObj2);
            ++i2;
         }
         copyDropDown.dataProvider = collObj2;
         copyDropDown.editable = false;
         copyDropDown.enabled = true;
         copyDropDown.prompt = "Copy";
         copyDropDown.restrict = "";
         copyDropDown.rowCount = 5;
         copyDropDown.visible = true;
         try
         {
            copyDropDown["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id7__Scene1_Layer1_1() : *
      {
         try
         {
            __id7_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id7_.autoSize = "none";
         __id7_.condenseWhite = false;
         __id7_.enabled = true;
         __id7_.htmlText = "";
         __id7_.selectable = false;
         __id7_.text = "Duration:";
         __id7_.visible = true;
         __id7_.wordWrap = false;
         try
         {
            __id7_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp_controlPlay_Scene1_Layer1_1() : *
      {
         try
         {
            controlPlay["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         controlPlay.emphasized = false;
         controlPlay.enabled = true;
         controlPlay.label = ">";
         controlPlay.labelPlacement = "right";
         controlPlay.selected = false;
         controlPlay.toggle = false;
         controlPlay.visible = true;
         try
         {
            controlPlay["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp_btnResetAll_Scene1_Layer1_1() : *
      {
         try
         {
            btnResetAll["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         btnResetAll.emphasized = false;
         btnResetAll.enabled = true;
         btnResetAll.label = "rs all";
         btnResetAll.labelPlacement = "right";
         btnResetAll.selected = false;
         btnResetAll.toggle = false;
         btnResetAll.visible = true;
         try
         {
            btnResetAll["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp_btnHelp_Scene1_Layer1_1() : *
      {
         try
         {
            btnHelp["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         btnHelp.emphasized = false;
         btnHelp.enabled = true;
         btnHelp.label = "Help";
         btnHelp.labelPlacement = "right";
         btnHelp.selected = false;
         btnHelp.toggle = false;
         btnHelp.visible = true;
         try
         {
            btnHelp["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp_LoadXAF_Scene1_Layer1_1() : *
      {
         try
         {
            LoadXAF["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         LoadXAF.emphasized = false;
         LoadXAF.enabled = true;
         LoadXAF.label = "Load";
         LoadXAF.labelPlacement = "right";
         LoadXAF.selected = false;
         LoadXAF.toggle = false;
         LoadXAF.visible = true;
         try
         {
            LoadXAF["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp_btnResetBone_Scene1_Layer1_1() : *
      {
         try
         {
            btnResetBone["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         btnResetBone.emphasized = false;
         btnResetBone.enabled = true;
         btnResetBone.label = "rs bone";
         btnResetBone.labelPlacement = "right";
         btnResetBone.selected = false;
         btnResetBone.toggle = false;
         btnResetBone.visible = true;
         try
         {
            btnResetBone["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp_controlStop_Scene1_Layer1_1() : *
      {
         try
         {
            controlStop["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         controlStop.emphasized = false;
         controlStop.enabled = true;
         controlStop.label = "□";
         controlStop.labelPlacement = "right";
         controlStop.selected = false;
         controlStop.toggle = false;
         controlStop.visible = true;
         try
         {
            controlStop["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp_btnBoneZoom_Scene1_Layer1_1() : *
      {
         try
         {
            btnBoneZoom["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         btnBoneZoom.emphasized = false;
         btnBoneZoom.enabled = true;
         btnBoneZoom.label = "Zoom";
         btnBoneZoom.labelPlacement = "right";
         btnBoneZoom.selected = false;
         btnBoneZoom.toggle = true;
         btnBoneZoom.visible = true;
         try
         {
            btnBoneZoom["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp_durationStepper_Scene1_Layer1_1() : *
      {
         try
         {
            durationStepper["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         durationStepper.enabled = true;
         durationStepper.maximum = 120;
         durationStepper.minimum = 1;
         durationStepper.stepSize = 1;
         durationStepper.value = 10;
         durationStepper.visible = true;
         try
         {
            durationStepper["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id4__Scene1_Layer1_1() : *
      {
         try
         {
            __id4_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id4_.emphasized = false;
         __id4_.enabled = false;
         __id4_.label = "";
         __id4_.labelPlacement = "right";
         __id4_.selected = false;
         __id4_.toggle = false;
         __id4_.visible = true;
         try
         {
            __id4_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
      
      internal function __setProp___id6__Scene1_Layer1_1() : *
      {
         try
         {
            __id6_["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         __id6_.condenseWhite = false;
         __id6_.editable = false;
         __id6_.enabled = true;
         __id6_.horizontalScrollPolicy = "auto";
         __id6_.htmlText = "";
         __id6_.maxChars = 0;
         __id6_.restrict = "";
         __id6_.text = "";
         __id6_.verticalScrollPolicy = "auto";
         __id6_.visible = true;
         __id6_.wordWrap = true;
         try
         {
            __id6_["componentInspectorSetting"] = false;
         }
         catch(e:Error)
         {
         }
      }
   }
}

