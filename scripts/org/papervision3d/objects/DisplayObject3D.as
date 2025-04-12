package org.papervision3d.objects
{
   import flash.display.BlendMode;
   import org.papervision3d.Papervision3D;
   import org.papervision3d.core.culling.FrustumTestMethod;
   import org.papervision3d.core.data.UserData;
   import org.papervision3d.core.log.PaperLogger;
   import org.papervision3d.core.math.Matrix3D;
   import org.papervision3d.core.math.Number3D;
   import org.papervision3d.core.math.Quaternion;
   import org.papervision3d.core.proto.CameraObject3D;
   import org.papervision3d.core.proto.DisplayObjectContainer3D;
   import org.papervision3d.core.proto.GeometryObject3D;
   import org.papervision3d.core.proto.MaterialObject3D;
   import org.papervision3d.core.proto.SceneObject3D;
   import org.papervision3d.core.render.data.RenderSessionData;
   import org.papervision3d.materials.utils.MaterialsList;
   import org.papervision3d.view.Viewport3D;
   import org.papervision3d.view.layer.ViewportLayer;
   
   public class DisplayObject3D extends DisplayObjectContainer3D
   {
      public static var faceLevelMode:Boolean;
      
      public static const MESH_SORT_CENTER:uint = 1;
      
      public static const MESH_SORT_FAR:uint = 2;
      
      public static const MESH_SORT_CLOSE:uint = 3;
      
      public static var sortedArray:Array = new Array();
      
      private static const FORWARD:Number3D = new Number3D(0,0,1);
      
      private static const BACKWARD:Number3D = new Number3D(0,0,-1);
      
      private static const LEFT:Number3D = new Number3D(-1,0,0);
      
      private static const RIGHT:Number3D = new Number3D(1,0,0);
      
      private static const UP:Number3D = new Number3D(0,1,0);
      
      private static const DOWN:Number3D = new Number3D(0,-1,0);
      
      private static var _tempMatrix:Matrix3D = Matrix3D.IDENTITY;
      
      private static var _tempQuat:Quaternion = new Quaternion();
      
      private static var _newID:int = 0;
      
      private static var toDEGREES:Number = 180 / Math.PI;
      
      private static var toRADIANS:Number = Math.PI / 180;
      
      private static var entry_count:uint = 0;
      
      public var filters:Array;
      
      public var extra:Object;
      
      public var frustumTestMethod:int = 0;
      
      private var _rot:Quaternion;
      
      public var id:int;
      
      private var _rotationY:Number;
      
      private var _rotationZ:Number;
      
      public var meshSort:uint = 1;
      
      public var materials:MaterialsList;
      
      private var _rotationX:Number;
      
      private var _qYaw:Quaternion;
      
      private var _xAxis:Number3D;
      
      private var _zAxis:Number3D;
      
      private var _scaleDirty:Boolean = false;
      
      private var _tempScale:Number3D;
      
      private var _autoCalcScreenCoords:Boolean = false;
      
      private var _numClones:uint = 0;
      
      public var alpha:Number = 1;
      
      public var screen:Number3D;
      
      private var _scaleX:Number;
      
      public var screenZ:Number;
      
      private var _scaleZ:Number;
      
      public var geometry:GeometryObject3D;
      
      protected var _userData:UserData;
      
      private var _scaleY:Number;
      
      public var visible:Boolean;
      
      private var _qPitch:Quaternion;
      
      protected var _useOwnContainer:Boolean = false;
      
      public var name:String;
      
      public var transform:Matrix3D;
      
      private var _position:Number3D;
      
      public var container:ViewportLayer;
      
      public var culled:Boolean;
      
      public var world:Matrix3D;
      
      public var blendMode:String = "normal";
      
      private var _qRoll:Quaternion;
      
      private var _localRotationZ:Number = 0;
      
      protected var _scene:SceneObject3D = null;
      
      private var _localRotationX:Number = 0;
      
      private var _material:MaterialObject3D;
      
      public var view:Matrix3D;
      
      private var _localRotationY:Number = 0;
      
      public var parent:DisplayObjectContainer3D;
      
      private var _target:Number3D;
      
      public var faces:Array;
      
      private var _yAxis:Number3D;
      
      public var flipLightDirection:Boolean = false;
      
      private var _rotation:Number3D;
      
      protected var _sorted:Array;
      
      protected var _transformDirty:Boolean = false;
      
      private var _rotationDirty:Boolean = false;
      
      public var parentContainer:DisplayObject3D;
      
      public function DisplayObject3D(param1:String = null, param2:GeometryObject3D = null)
      {
         var _loc3_:Number = NaN;
         faces = new Array();
         meshSort = MESH_SORT_CENTER;
         alpha = 1;
         blendMode = BlendMode.NORMAL;
         filters = [];
         flipLightDirection = false;
         frustumTestMethod = FrustumTestMethod.BOUNDING_SPHERE;
         screen = new Number3D();
         _transformDirty = false;
         _useOwnContainer = false;
         _scene = null;
         _position = Number3D.ZERO;
         _target = Number3D.ZERO;
         _zAxis = Number3D.ZERO;
         _xAxis = Number3D.ZERO;
         _yAxis = Number3D.ZERO;
         _rotation = Number3D.ZERO;
         _rotationDirty = false;
         _scaleDirty = false;
         _numClones = 0;
         _rot = new Quaternion();
         _qPitch = new Quaternion();
         _qYaw = new Quaternion();
         _qRoll = new Quaternion();
         _localRotationX = 0;
         _localRotationY = 0;
         _localRotationZ = 0;
         _autoCalcScreenCoords = false;
         super();
         if(param1 != null)
         {
            PaperLogger.info("DisplayObject3D: " + param1);
         }
         this.culled = false;
         this.transform = Matrix3D.IDENTITY;
         this.world = Matrix3D.IDENTITY;
         this.view = Matrix3D.IDENTITY;
         this.x = 0;
         this.y = 0;
         this.z = 0;
         rotationX = 0;
         rotationY = 0;
         rotationZ = 0;
         _localRotationX = _localRotationY = _localRotationZ = 0;
         _loc3_ = Papervision3D.usePERCENT ? 100 : 1;
         scaleX = _loc3_;
         scaleY = _loc3_;
         scaleZ = _loc3_;
         _tempScale = new Number3D();
         this.visible = true;
         this.id = _newID++;
         this.name = param1 || String(this.id);
         _numClones = 0;
         if(param2)
         {
            addGeometry(param2);
         }
      }
      
      public static function get ZERO() : DisplayObject3D
      {
         return new DisplayObject3D();
      }
      
      public function moveDown(param1:Number) : void
      {
         translate(param1,DOWN);
      }
      
      public function project(param1:DisplayObject3D, param2:RenderSessionData) : Number
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:DisplayObject3D = null;
         if(this._transformDirty)
         {
            updateTransform();
         }
         this.world.calculateMultiply(param1.world,this.transform);
         if(param2.camera.culler)
         {
            if(this === param2.camera)
            {
               this.culled = true;
            }
            else
            {
               this.culled = param2.camera.culler.testObject(this) < 0;
            }
            if(this.culled)
            {
               ++param2.renderStatistics.culledObjects;
               return 0;
            }
         }
         if(param1 !== param2.camera)
         {
            if(param2.camera.useProjectionMatrix)
            {
               this.view.calculateMultiply4x4(param1.view,this.transform);
            }
            else
            {
               this.view.calculateMultiply(param1.view,this.transform);
            }
         }
         else if(param2.camera.useProjectionMatrix)
         {
            this.view.calculateMultiply4x4(param2.camera.eye,this.transform);
         }
         else
         {
            this.view.calculateMultiply(param2.camera.eye,this.transform);
         }
         if(_autoCalcScreenCoords)
         {
            calculateScreenCoords(param2.camera);
         }
         _loc3_ = 0;
         _loc4_ = 0;
         for each(_loc5_ in this._childrenByName)
         {
            if(_loc5_.visible)
            {
               _loc3_ += _loc5_.project(this,param2);
               _loc4_++;
            }
         }
         return this.screenZ = _loc3_ / _loc4_;
      }
      
      public function set scene(param1:SceneObject3D) : void
      {
         var _loc2_:DisplayObject3D = null;
         _scene = param1;
         for each(_loc2_ in this._childrenByName)
         {
            if(_loc2_.scene == null)
            {
               _loc2_.scene = _scene;
            }
         }
      }
      
      public function set z(param1:Number) : void
      {
         this.transform.n34 = param1;
      }
      
      public function get userData() : UserData
      {
         return _userData;
      }
      
      public function get material() : MaterialObject3D
      {
         return _material;
      }
      
      public function set userData(param1:UserData) : void
      {
         _userData = param1;
      }
      
      public function lookAt(param1:DisplayObject3D, param2:Number3D = null) : void
      {
         var _loc3_:DisplayObject3D = null;
         var _loc4_:Matrix3D = null;
         if(this is CameraObject3D)
         {
            _position.reset(this.x,this.y,this.z);
         }
         else
         {
            _loc3_ = this.parent as DisplayObject3D;
            if(_loc3_)
            {
               world.calculateMultiply(_loc3_.world,transform);
            }
            else
            {
               world.copy(transform);
            }
            _position.reset(world.n14,world.n24,world.n34);
         }
         if(param1 is CameraObject3D)
         {
            _target.reset(param1.x,param1.y,param1.z);
         }
         else
         {
            _loc3_ = param1.parent as DisplayObject3D;
            if(_loc3_)
            {
               param1.world.calculateMultiply(_loc3_.world,param1.transform);
            }
            else
            {
               param1.world.copy(param1.transform);
            }
            _target.reset(param1.world.n14,param1.world.n24,param1.world.n34);
         }
         _zAxis.copyFrom(_target);
         _zAxis.minusEq(_position);
         _zAxis.normalize();
         if(_zAxis.modulo > 0.1)
         {
            _xAxis = Number3D.cross(_zAxis,param2 || UP,_xAxis);
            _xAxis.normalize();
            _yAxis = Number3D.cross(_zAxis,_xAxis,_yAxis);
            _yAxis.normalize();
            _loc4_ = this.transform;
            _loc4_.n11 = _xAxis.x * _scaleX;
            _loc4_.n21 = _xAxis.y * _scaleX;
            _loc4_.n31 = _xAxis.z * _scaleX;
            _loc4_.n12 = -_yAxis.x * _scaleY;
            _loc4_.n22 = -_yAxis.y * _scaleY;
            _loc4_.n32 = -_yAxis.z * _scaleY;
            _loc4_.n13 = _zAxis.x * _scaleZ;
            _loc4_.n23 = _zAxis.y * _scaleZ;
            _loc4_.n33 = _zAxis.z * _scaleZ;
            _localRotationX = _localRotationY = _localRotationZ = 0;
            this._transformDirty = false;
            this._rotationDirty = true;
         }
         else
         {
            PaperLogger.error("lookAt error");
         }
      }
      
      public function set rotationX(param1:Number) : void
      {
         this._rotationX = Papervision3D.useDEGREES ? param1 * toRADIANS : param1;
         this._transformDirty = true;
      }
      
      public function calculateScreenCoords(param1:CameraObject3D) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(param1.useProjectionMatrix)
         {
            _loc2_ = 0;
            _loc3_ = 0;
            _loc4_ = 0;
            _loc5_ = _loc2_ * view.n41 + _loc3_ * view.n42 + _loc4_ * view.n43 + view.n44;
            _loc6_ = param1.viewport.width / 2;
            _loc7_ = param1.viewport.height / 2;
            screen.x = (_loc2_ * view.n11 + _loc3_ * view.n12 + _loc4_ * view.n13 + view.n14) / _loc5_;
            screen.y = (_loc2_ * view.n21 + _loc3_ * view.n22 + _loc4_ * view.n23 + view.n24) / _loc5_;
            screen.z = _loc2_ * view.n31 + _loc3_ * view.n32 + _loc4_ * view.n33 + view.n34;
            screen.x *= _loc6_;
            screen.y *= _loc7_;
         }
         else
         {
            _loc8_ = param1.focus * param1.zoom / (param1.focus + view.n34);
            screen.x = view.n14 * _loc8_;
            screen.y = view.n24 * _loc8_;
            screen.z = view.n34;
         }
      }
      
      public function set rotationZ(param1:Number) : void
      {
         this._rotationZ = Papervision3D.useDEGREES ? param1 * toRADIANS : param1;
         this._transformDirty = true;
      }
      
      protected function setParentContainer(param1:DisplayObject3D, param2:Boolean = true) : void
      {
         var _loc3_:DisplayObject3D = null;
         if(param2 && param1 != this)
         {
            parentContainer = param1;
         }
         for each(_loc3_ in children)
         {
            _loc3_.setParentContainer(param1,param2);
         }
      }
      
      public function addGeometry(param1:GeometryObject3D = null) : void
      {
         if(param1)
         {
            this.geometry = param1;
         }
      }
      
      public function get sceneX() : Number
      {
         return this.world.n14;
      }
      
      public function get scaleY() : Number
      {
         if(Papervision3D.usePERCENT)
         {
            return this._scaleY * 100;
         }
         return this._scaleY;
      }
      
      public function get scaleZ() : Number
      {
         if(Papervision3D.usePERCENT)
         {
            return this._scaleZ * 100;
         }
         return this._scaleZ;
      }
      
      public function moveUp(param1:Number) : void
      {
         translate(param1,UP);
      }
      
      public function get scaleX() : Number
      {
         if(Papervision3D.usePERCENT)
         {
            return this._scaleX * 100;
         }
         return this._scaleX;
      }
      
      public function distanceTo(param1:DisplayObject3D) : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         _loc2_ = this.x - param1.x;
         _loc3_ = this.y - param1.y;
         _loc4_ = this.z - param1.z;
         return Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_ + _loc4_ * _loc4_);
      }
      
      public function get scale() : Number
      {
         if(this._scaleX == this._scaleY && this._scaleX == this._scaleZ)
         {
            if(Papervision3D.usePERCENT)
            {
               return this._scaleX * 100;
            }
            return this._scaleX;
         }
         return NaN;
      }
      
      public function set rotationY(param1:Number) : void
      {
         this._rotationY = Papervision3D.useDEGREES ? param1 * toRADIANS : param1;
         this._transformDirty = true;
      }
      
      public function clone() : DisplayObject3D
      {
         var _loc1_:String = null;
         var _loc2_:DisplayObject3D = null;
         var _loc3_:DisplayObject3D = null;
         _loc1_ = this.name + "_" + _numClones++;
         _loc2_ = new DisplayObject3D(_loc1_);
         if(this.material)
         {
            _loc2_.material = this.material;
         }
         if(this.materials)
         {
            _loc2_.materials = this.materials.clone();
         }
         if(this.geometry)
         {
            _loc2_.geometry = this.geometry.clone(_loc2_);
            _loc2_.geometry.ready = true;
         }
         _loc2_.copyTransform(this.transform);
         for each(_loc3_ in this.children)
         {
            _loc2_.addChild(_loc3_.clone());
         }
         return _loc2_;
      }
      
      public function get sceneZ() : Number
      {
         return this.world.n34;
      }
      
      private function updateRotation() : void
      {
         _tempScale.x = Papervision3D.usePERCENT ? _scaleX * 100 : _scaleX;
         _tempScale.y = Papervision3D.usePERCENT ? _scaleY * 100 : _scaleY;
         _tempScale.z = Papervision3D.usePERCENT ? _scaleZ * 100 : _scaleZ;
         _rotation = Matrix3D.matrix2euler(this.transform,_rotation,_tempScale);
         this._rotationX = _rotation.x * toRADIANS;
         this._rotationY = _rotation.y * toRADIANS;
         this._rotationZ = _rotation.z * toRADIANS;
         this._rotationDirty = false;
      }
      
      public function hitTestObject(param1:DisplayObject3D, param2:Number = 1) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         _loc3_ = this.x - param1.x;
         _loc4_ = this.y - param1.y;
         _loc5_ = this.z - param1.z;
         _loc6_ = _loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_;
         _loc7_ = !!this.geometry ? this.geometry.boundingSphere.maxDistance : 0;
         _loc8_ = !!param1.geometry ? param1.geometry.boundingSphere.maxDistance : 0;
         _loc7_ *= param2;
         return _loc7_ + _loc8_ > _loc6_;
      }
      
      public function set material(param1:MaterialObject3D) : void
      {
         if(_material)
         {
            _material.unregisterObject(this);
         }
         _material = param1;
         _material.registerObject(this);
      }
      
      public function get localRotationZ() : Number
      {
         return Papervision3D.useDEGREES ? _localRotationZ * toDEGREES : _localRotationZ;
      }
      
      override public function toString() : String
      {
         return this.name + ": x:" + Math.round(this.x) + " y:" + Math.round(this.y) + " z:" + Math.round(this.z);
      }
      
      public function get localRotationY() : Number
      {
         return Papervision3D.useDEGREES ? _localRotationY * toDEGREES : _localRotationY;
      }
      
      public function get z() : Number
      {
         return this.transform.n34;
      }
      
      public function get localRotationX() : Number
      {
         return Papervision3D.useDEGREES ? _localRotationX * toDEGREES : _localRotationX;
      }
      
      public function get x() : Number
      {
         return this.transform.n14;
      }
      
      public function set autoCalcScreenCoords(param1:Boolean) : void
      {
         _autoCalcScreenCoords = param1;
      }
      
      public function moveLeft(param1:Number) : void
      {
         translate(param1,LEFT);
      }
      
      public function get scene() : SceneObject3D
      {
         return _scene;
      }
      
      public function set useOwnContainer(param1:Boolean) : void
      {
         _useOwnContainer = param1;
         setParentContainer(this,true);
      }
      
      public function copyTransform(param1:*) : void
      {
         var _loc2_:Matrix3D = null;
         var _loc3_:Matrix3D = null;
         if(param1 is DisplayObject3D)
         {
            DisplayObject3D(param1).updateTransform();
         }
         _loc2_ = this.transform;
         _loc3_ = param1 is DisplayObject3D ? param1.transform : param1;
         _loc2_.n11 = _loc3_.n11;
         _loc2_.n12 = _loc3_.n12;
         _loc2_.n13 = _loc3_.n13;
         _loc2_.n14 = _loc3_.n14;
         _loc2_.n21 = _loc3_.n21;
         _loc2_.n22 = _loc3_.n22;
         _loc2_.n23 = _loc3_.n23;
         _loc2_.n24 = _loc3_.n24;
         _loc2_.n31 = _loc3_.n31;
         _loc2_.n32 = _loc3_.n32;
         _loc2_.n33 = _loc3_.n33;
         _loc2_.n34 = _loc3_.n34;
         this._transformDirty = false;
         this._rotationDirty = true;
      }
      
      public function get y() : Number
      {
         return this.transform.n24;
      }
      
      public function roll(param1:Number) : void
      {
         param1 = Papervision3D.useDEGREES ? param1 * toRADIANS : param1;
         if(_transformDirty)
         {
            updateTransform();
         }
         _qRoll.setFromAxisAngle(transform.n13,transform.n23,transform.n33,param1);
         transform.calculateMultiply3x3(_qRoll.matrix,transform);
         _localRotationZ += param1;
         _rotationDirty = true;
      }
      
      public function set scaleZ(param1:Number) : void
      {
         if(Papervision3D.usePERCENT)
         {
            this._scaleZ = param1 / 100;
         }
         else
         {
            this._scaleZ = param1;
         }
         this._transformDirty = true;
      }
      
      public function get rotationY() : Number
      {
         if(this._rotationDirty)
         {
            updateRotation();
         }
         return Papervision3D.useDEGREES ? this._rotationY * toDEGREES : this._rotationY;
      }
      
      public function get rotationZ() : Number
      {
         if(this._rotationDirty)
         {
            updateRotation();
         }
         return Papervision3D.useDEGREES ? this._rotationZ * toDEGREES : this._rotationZ;
      }
      
      public function yaw(param1:Number) : void
      {
         param1 = Papervision3D.useDEGREES ? param1 * toRADIANS : param1;
         if(_transformDirty)
         {
            updateTransform();
         }
         _qYaw.setFromAxisAngle(transform.n12,transform.n22,transform.n32,param1);
         transform.calculateMultiply3x3(_qYaw.matrix,transform);
         _localRotationY += param1;
         _rotationDirty = true;
      }
      
      public function get rotationX() : Number
      {
         if(this._rotationDirty)
         {
            updateRotation();
         }
         return Papervision3D.useDEGREES ? this._rotationX * toDEGREES : this._rotationX;
      }
      
      public function set scaleX(param1:Number) : void
      {
         if(Papervision3D.usePERCENT)
         {
            this._scaleX = param1 / 100;
         }
         else
         {
            this._scaleX = param1;
         }
         this._transformDirty = true;
      }
      
      public function set scaleY(param1:Number) : void
      {
         if(Papervision3D.usePERCENT)
         {
            this._scaleY = param1 / 100;
         }
         else
         {
            this._scaleY = param1;
         }
         this._transformDirty = true;
      }
      
      public function createViewportLayer(param1:Viewport3D, param2:Boolean = true) : ViewportLayer
      {
         var _loc3_:ViewportLayer = null;
         _loc3_ = param1.getChildLayer(this,true);
         if(param2)
         {
            addChildrenToLayer(this,_loc3_);
         }
         return _loc3_;
      }
      
      public function translate(param1:Number, param2:Number3D) : void
      {
         var _loc3_:Number3D = null;
         _loc3_ = param2.clone();
         if(this._transformDirty)
         {
            updateTransform();
         }
         Matrix3D.rotateAxis(transform,_loc3_);
         this.x += param1 * _loc3_.x;
         this.y += param1 * _loc3_.y;
         this.z += param1 * _loc3_.z;
      }
      
      public function updateTransform() : void
      {
         _rot.setFromEuler(_rotationY,_rotationZ,_rotationX);
         this.transform.copy3x3(_rot.matrix);
         _tempMatrix.reset();
         _tempMatrix.n11 = this._scaleX;
         _tempMatrix.n22 = this._scaleY;
         _tempMatrix.n33 = this._scaleZ;
         this.transform.calculateMultiply(this.transform,_tempMatrix);
         _transformDirty = false;
      }
      
      public function get autoCalcScreenCoords() : Boolean
      {
         return _autoCalcScreenCoords;
      }
      
      public function addChildrenToLayer(param1:DisplayObject3D, param2:ViewportLayer) : void
      {
         var _loc3_:DisplayObject3D = null;
         for each(_loc3_ in param1.children)
         {
            param2.addDisplayObject3D(_loc3_);
            _loc3_.addChildrenToLayer(_loc3_,param2);
         }
      }
      
      public function copyPosition(param1:*) : void
      {
         var _loc2_:Matrix3D = null;
         var _loc3_:Matrix3D = null;
         _loc2_ = this.transform;
         _loc3_ = param1 is DisplayObject3D ? param1.transform : param1;
         _loc2_.n14 = _loc3_.n14;
         _loc2_.n24 = _loc3_.n24;
         _loc2_.n34 = _loc3_.n34;
      }
      
      public function get useOwnContainer() : Boolean
      {
         return _useOwnContainer;
      }
      
      public function getMaterialByName(param1:String) : MaterialObject3D
      {
         var _loc2_:MaterialObject3D = null;
         var _loc3_:DisplayObject3D = null;
         _loc2_ = !!this.materials ? this.materials.getMaterialByName(param1) : null;
         if(_loc2_)
         {
            return _loc2_;
         }
         for each(_loc3_ in this._childrenByName)
         {
            _loc2_ = _loc3_.getMaterialByName(param1);
            if(_loc2_)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function hitTestPoint(param1:Number, param2:Number, param3:Number) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         _loc4_ = this.x - param1;
         _loc5_ = this.y - param2;
         _loc6_ = this.z - param3;
         _loc7_ = _loc4_ * _loc4_ + _loc5_ * _loc5_ + _loc6_ * _loc6_;
         _loc8_ = !!this.geometry ? this.geometry.boundingSphere.maxDistance : 0;
         return _loc8_ > _loc7_;
      }
      
      public function moveForward(param1:Number) : void
      {
         translate(param1,FORWARD);
      }
      
      public function set scale(param1:Number) : void
      {
         if(Papervision3D.usePERCENT)
         {
            param1 /= 100;
         }
         this._scaleX = this._scaleY = this._scaleZ = param1;
         this._transformDirty = true;
      }
      
      public function get sceneY() : Number
      {
         return this.world.n24;
      }
      
      public function moveRight(param1:Number) : void
      {
         translate(param1,RIGHT);
      }
      
      public function moveBackward(param1:Number) : void
      {
         translate(param1,BACKWARD);
      }
      
      public function set localRotationY(param1:Number) : void
      {
         param1 = Papervision3D.useDEGREES ? param1 * toRADIANS : param1;
         if(_transformDirty)
         {
            updateTransform();
         }
         _qYaw.setFromAxisAngle(transform.n12,transform.n22,transform.n32,_localRotationY - param1);
         transform.calculateMultiply3x3(_qYaw.matrix,transform);
         _localRotationY = param1;
         _rotationDirty = true;
      }
      
      public function set localRotationZ(param1:Number) : void
      {
         param1 = Papervision3D.useDEGREES ? param1 * toRADIANS : param1;
         if(_transformDirty)
         {
            updateTransform();
         }
         _qRoll.setFromAxisAngle(transform.n13,transform.n23,transform.n33,_localRotationZ - param1);
         transform.calculateMultiply3x3(_qRoll.matrix,transform);
         _localRotationZ = param1;
         _rotationDirty = true;
      }
      
      public function set localRotationX(param1:Number) : void
      {
         param1 = Papervision3D.useDEGREES ? param1 * toRADIANS : param1;
         if(this._transformDirty)
         {
            updateTransform();
         }
         _qPitch.setFromAxisAngle(transform.n11,transform.n21,transform.n31,_localRotationX - param1);
         this.transform.calculateMultiply3x3(_qPitch.matrix,transform);
         _localRotationX = param1;
         _rotationDirty = true;
      }
      
      public function set x(param1:Number) : void
      {
         this.transform.n14 = param1;
      }
      
      public function materialsList() : String
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         var _loc3_:DisplayObject3D = null;
         _loc1_ = "";
         for(_loc2_ in this.materials)
         {
            _loc1_ += _loc2_ + "\n";
         }
         for each(_loc3_ in this._childrenByName)
         {
            for(_loc2_ in _loc3_.materials.materialsByName)
            {
               _loc1_ += "+ " + _loc2_ + "\n";
            }
         }
         return _loc1_;
      }
      
      public function set y(param1:Number) : void
      {
         this.transform.n24 = param1;
      }
      
      override public function addChild(param1:DisplayObject3D, param2:String = null) : DisplayObject3D
      {
         param1 = super.addChild(param1,param2);
         if(param1.scene == null)
         {
            param1.scene = scene;
         }
         if(this.useOwnContainer)
         {
            param1.parentContainer = this;
         }
         return param1;
      }
      
      public function pitch(param1:Number) : void
      {
         param1 = Papervision3D.useDEGREES ? param1 * toRADIANS : param1;
         if(this._transformDirty)
         {
            updateTransform();
         }
         _qPitch.setFromAxisAngle(transform.n11,transform.n21,transform.n31,param1);
         this.transform.calculateMultiply3x3(_qPitch.matrix,transform);
         _localRotationX += param1;
         _rotationDirty = true;
      }
   }
}

