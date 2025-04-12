package org.papervision3d.cameras
{
   import flash.geom.Rectangle;
   import org.papervision3d.core.culling.FrustumCuller;
   import org.papervision3d.core.geom.renderables.Vertex3D;
   import org.papervision3d.core.geom.renderables.Vertex3DInstance;
   import org.papervision3d.core.math.Matrix3D;
   import org.papervision3d.core.proto.CameraObject3D;
   import org.papervision3d.core.render.data.RenderSessionData;
   import org.papervision3d.objects.DisplayObject3D;
   
   public class Camera3D extends CameraObject3D
   {
      private var _prevZoom:Number;
      
      private var _prevOrthoProjection:Boolean;
      
      private var _prevHeight:Number;
      
      private var _prevFocus:Number;
      
      private var _prevUseProjection:Boolean;
      
      private var _focusFix:Matrix3D;
      
      private var _prevOrtho:Boolean;
      
      private var _prevWidth:Number;
      
      private var _projection:Matrix3D;
      
      public function Camera3D(param1:Number = 60, param2:Number = 10, param3:Number = 5000, param4:Boolean = false, param5:Boolean = false)
      {
         super(param2,40);
         _prevFocus = 0;
         _prevZoom = 0;
         _prevOrtho = false;
         _prevUseProjection = false;
         _useCulling = param4;
         _useProjectionMatrix = param5;
         _far = param3;
         _focusFix = Matrix3D.IDENTITY;
      }
      
      public static function createPerspectiveMatrix(param1:Number, param2:Number, param3:Number, param4:Number) : Matrix3D
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         _loc5_ = param1 / 2 * (Math.PI / 180);
         _loc6_ = Math.tan(_loc5_);
         _loc7_ = 1 / _loc6_;
         return new Matrix3D([_loc7_ / param2,0,0,0,0,_loc7_,0,0,0,0,-((param3 + param4) / (param3 - param4)),2 * param4 * param3 / (param3 - param4),0,0,1,0]);
      }
      
      public static function createOrthoMatrix(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : Matrix3D
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Matrix3D = null;
         _loc7_ = (param2 + param1) / (param2 - param1);
         _loc8_ = (param4 + param3) / (param4 - param3);
         _loc9_ = (param6 + param5) / (param6 - param5);
         _loc10_ = new Matrix3D([2 / (param2 - param1),0,0,_loc7_,0,2 / (param4 - param3),0,_loc8_,0,0,-2 / (param6 - param5),_loc9_,0,0,0,1]);
         _loc10_.calculateMultiply(Matrix3D.scaleMatrix(1,1,-1),_loc10_);
         return _loc10_;
      }
      
      override public function set far(param1:Number) : void
      {
         if(param1 > this.focus)
         {
            _far = param1;
            this.update(this.viewport);
         }
      }
      
      override public function projectVertices(param1:DisplayObject3D, param2:RenderSessionData) : Number
      {
         var _loc3_:Matrix3D = null;
         var _loc4_:Array = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Vertex3D = null;
         var _loc25_:Vertex3DInstance = null;
         var _loc26_:Number = NaN;
         var _loc27_:int = 0;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc32_:Number = NaN;
         var _loc33_:Number = NaN;
         if(!param1.geometry || !param1.geometry.vertices)
         {
            return 0;
         }
         _loc3_ = param1.view;
         _loc4_ = param1.geometry.vertices;
         _loc5_ = _loc3_.n11;
         _loc6_ = _loc3_.n12;
         _loc7_ = _loc3_.n13;
         _loc8_ = _loc3_.n21;
         _loc9_ = _loc3_.n22;
         _loc10_ = _loc3_.n23;
         _loc11_ = _loc3_.n31;
         _loc12_ = _loc3_.n32;
         _loc13_ = _loc3_.n33;
         _loc14_ = _loc3_.n41;
         _loc15_ = _loc3_.n42;
         _loc16_ = _loc3_.n43;
         _loc27_ = int(_loc4_.length);
         _loc28_ = param2.camera.focus;
         _loc29_ = _loc28_ * param2.camera.zoom;
         _loc30_ = viewport.width / 2;
         _loc31_ = viewport.height / 2;
         _loc32_ = param2.camera.far;
         _loc33_ = _loc32_ - _loc28_;
         while(true)
         {
            _loc24_ = _loc4_[--_loc27_];
            if(!_loc24_)
            {
               break;
            }
            _loc17_ = _loc24_.x;
            _loc18_ = _loc24_.y;
            _loc19_ = _loc24_.z;
            _loc22_ = _loc17_ * _loc11_ + _loc18_ * _loc12_ + _loc19_ * _loc13_ + _loc3_.n34;
            _loc25_ = _loc24_.vertex3DInstance;
            if(_useProjectionMatrix)
            {
               _loc23_ = _loc17_ * _loc14_ + _loc18_ * _loc15_ + _loc19_ * _loc16_ + _loc3_.n44;
               _loc22_ /= _loc23_;
               if(_loc25_.visible = _loc22_ > 0 && _loc22_ < 1)
               {
                  _loc20_ = (_loc17_ * _loc5_ + _loc18_ * _loc6_ + _loc19_ * _loc7_ + _loc3_.n14) / _loc23_;
                  _loc21_ = (_loc17_ * _loc8_ + _loc18_ * _loc9_ + _loc19_ * _loc10_ + _loc3_.n24) / _loc23_;
                  _loc25_.x = _loc20_ * _loc30_;
                  _loc25_.y = _loc21_ * _loc31_;
                  _loc25_.z = _loc22_ * _loc23_;
               }
            }
            else if(_loc25_.visible = _loc28_ + _loc22_ > 0)
            {
               _loc20_ = _loc17_ * _loc5_ + _loc18_ * _loc6_ + _loc19_ * _loc7_ + _loc3_.n14;
               _loc21_ = _loc17_ * _loc8_ + _loc18_ * _loc9_ + _loc19_ * _loc10_ + _loc3_.n24;
               _loc26_ = _loc29_ / (_loc28_ + _loc22_);
               _loc25_.x = _loc20_ * _loc26_;
               _loc25_.y = _loc21_ * _loc26_;
               _loc25_.z = _loc22_;
            }
         }
         return 0;
      }
      
      override public function transformView(param1:Matrix3D = null) : void
      {
         if(ortho != _prevOrtho || _prevUseProjection != _useProjectionMatrix || focus != _prevFocus || zoom != _prevZoom || viewport.width != _prevWidth || viewport.height != _prevHeight)
         {
            update(viewport);
         }
         if(_target)
         {
            lookAt(_target);
         }
         else if(_transformDirty)
         {
            updateTransform();
         }
         if(_useProjectionMatrix)
         {
            super.transformView();
            this.eye.calculateMultiply4x4(_projection,this.eye);
         }
         else
         {
            _focusFix.copy(this.transform);
            _focusFix.n14 += focus * this.transform.n13;
            _focusFix.n24 += focus * this.transform.n23;
            _focusFix.n34 += focus * this.transform.n33;
            super.transformView(_focusFix);
         }
         if(culler is FrustumCuller)
         {
            FrustumCuller(culler).transform.copy(this.transform);
         }
      }
      
      override public function orbit(param1:Number, param2:Number, param3:Boolean = true, param4:DisplayObject3D = null) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         param4 ||= _target;
         param4 = (param4) || DisplayObject3D.ZERO;
         if(param3)
         {
            param1 *= Math.PI / 180;
            param2 *= Math.PI / 180;
         }
         _loc5_ = param4.world.n14 - this.x;
         _loc6_ = param4.world.n24 - this.y;
         _loc7_ = param4.world.n34 - this.z;
         _loc8_ = Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_ + _loc7_ * _loc7_);
         _loc9_ = Math.cos(param2) * Math.sin(param1);
         _loc10_ = Math.sin(param2) * Math.sin(param1);
         _loc11_ = Math.cos(param1);
         this.x = param4.world.n14 + _loc9_ * _loc8_;
         this.y = param4.world.n24 + _loc11_ * _loc8_;
         this.z = param4.world.n34 + _loc10_ * _loc8_;
         this.lookAt(param4);
      }
      
      override public function set near(param1:Number) : void
      {
         if(param1 > 0)
         {
            this.focus = param1;
            this.update(this.viewport);
         }
      }
      
      public function update(param1:Rectangle) : void
      {
         if(!param1)
         {
            throw new Error("Camera3D#update: Invalid viewport rectangle! " + param1);
         }
         this.viewport = param1;
         _prevFocus = this.focus;
         _prevZoom = this.zoom;
         _prevWidth = this.viewport.width;
         _prevHeight = this.viewport.height;
         if(_prevOrtho != this.ortho)
         {
            if(this.ortho)
            {
               _prevOrthoProjection = this.useProjectionMatrix;
               this.useProjectionMatrix = true;
            }
            else
            {
               this.useProjectionMatrix = _prevOrthoProjection;
            }
         }
         else if(_prevUseProjection != _useProjectionMatrix)
         {
            this.useProjectionMatrix = this._useProjectionMatrix;
         }
         _prevOrtho = this.ortho;
         _prevUseProjection = _useProjectionMatrix;
         this.useCulling = _useCulling;
      }
      
      override public function set orthoScale(param1:Number) : void
      {
         super.orthoScale = param1;
         this.useProjectionMatrix = this.useProjectionMatrix;
         _prevOrtho = !this.ortho;
         this.update(this.viewport);
      }
      
      override public function set useProjectionMatrix(param1:Boolean) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(param1)
         {
            if(this.ortho)
            {
               _loc2_ = viewport.width / 2;
               _loc3_ = viewport.height / 2;
               _projection = createOrthoMatrix(-_loc2_,_loc2_,-_loc3_,_loc3_,-_far,_far);
               _projection = Matrix3D.multiply(_orthoScaleMatrix,_projection);
            }
            else
            {
               _projection = createPerspectiveMatrix(fov,viewport.width / viewport.height,this.focus,this.far);
            }
         }
         else if(this.ortho)
         {
            param1 = true;
         }
         super.useProjectionMatrix = param1;
      }
      
      override public function set useCulling(param1:Boolean) : void
      {
         super.useCulling = param1;
         if(_useCulling)
         {
            if(!this.culler)
            {
               this.culler = new FrustumCuller();
            }
            FrustumCuller(this.culler).initialize(this.fov,this.viewport.width / this.viewport.height,this.focus / this.zoom,_far);
         }
         else
         {
            this.culler = null;
         }
      }
   }
}

