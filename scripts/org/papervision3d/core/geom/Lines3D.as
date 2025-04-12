package org.papervision3d.core.geom
{
   import org.papervision3d.core.geom.renderables.Line3D;
   import org.papervision3d.core.geom.renderables.Vertex3D;
   import org.papervision3d.core.log.PaperLogger;
   import org.papervision3d.core.render.data.RenderSessionData;
   import org.papervision3d.core.render.draw.ILineDrawer;
   import org.papervision3d.materials.special.LineMaterial;
   import org.papervision3d.objects.DisplayObject3D;
   
   public class Lines3D extends Vertices3D
   {
      public var lines:Array;
      
      private var _material:ILineDrawer;
      
      public function Lines3D(param1:LineMaterial, param2:String = null)
      {
         super(null,param2);
         this.material = param1;
         init();
      }
      
      private function init() : void
      {
         this.lines = new Array();
      }
      
      override public function project(param1:DisplayObject3D, param2:RenderSessionData) : Number
      {
         var _loc3_:Line3D = null;
         var _loc4_:Number = NaN;
         super.project(param1,param2);
         for each(_loc3_ in lines)
         {
            if(param2.viewPort.lineCuller.testLine(_loc3_))
            {
               _loc3_.renderCommand.renderer = _loc3_.material;
               _loc4_ += _loc3_.renderCommand.screenDepth = (_loc3_.v0.vertex3DInstance.z + _loc3_.v1.vertex3DInstance.z) / 2;
               param2.renderer.addToRenderList(_loc3_.renderCommand);
            }
         }
         return _loc4_ / (lines.length + 1);
      }
      
      public function addLine(param1:Line3D) : void
      {
         lines.push(param1);
         param1.instance = this;
         if(geometry.vertices.indexOf(param1.v0) == -1)
         {
            geometry.vertices.push(param1.v0);
         }
         if(geometry.vertices.indexOf(param1.v1) == -1)
         {
            geometry.vertices.push(param1.v1);
         }
         if(param1.cV)
         {
            if(geometry.vertices.indexOf(param1.cV) == -1)
            {
               geometry.vertices.push(param1.cV);
            }
         }
      }
      
      public function addNewSegmentedLine(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Line3D = null;
         var _loc13_:Vertex3D = null;
         var _loc14_:Vertex3D = null;
         var _loc15_:Number = NaN;
         _loc9_ = (param6 - param3) / param2;
         _loc10_ = (param7 - param4) / param2;
         _loc11_ = (param8 - param5) / param2;
         _loc13_ = new Vertex3D(param3,param4,param5);
         _loc15_ = 0;
         while(_loc15_ <= param2)
         {
            _loc14_ = new Vertex3D(param3 + _loc9_ * _loc15_,param4 + _loc10_ * _loc15_,param5 + _loc11_ * _loc15_);
            _loc12_ = new Line3D(this,material as LineMaterial,param1,_loc13_,_loc14_);
            addLine(_loc12_);
            _loc13_ = _loc14_;
            _loc15_++;
         }
      }
      
      public function removeAllLines() : void
      {
         PaperLogger.warning("Lines3D.removeAllLines not yet implemented");
      }
      
      public function removeLine(param1:Line3D) : void
      {
         var _loc2_:int = 0;
         _loc2_ = int(lines.indexOf(param1));
         if(_loc2_ > -1)
         {
            lines.splice(_loc2_,1);
         }
         else
         {
            PaperLogger.warning("Papervision3D Lines3D.removeLine : WARNING removal of non-existant line attempted. ");
         }
      }
      
      public function addNewLine(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : Line3D
      {
         var _loc8_:Line3D = null;
         _loc8_ = new Line3D(this,material as LineMaterial,param1,new Vertex3D(param2,param3,param4),new Vertex3D(param5,param6,param7));
         addLine(_loc8_);
         return _loc8_;
      }
   }
}

