package org.papervision3d.materials.shadematerials
{
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.geom.Matrix;
   import org.papervision3d.core.geom.renderables.Triangle3D;
   import org.papervision3d.core.material.AbstractLightShadeMaterial;
   import org.papervision3d.core.math.Matrix3D;
   import org.papervision3d.core.proto.LightObject3D;
   import org.papervision3d.core.render.data.RenderSessionData;
   import org.papervision3d.core.render.draw.ITriangleDrawer;
   import org.papervision3d.materials.utils.LightMaps;
   
   public class FlatShadeMaterial extends AbstractLightShadeMaterial implements ITriangleDrawer
   {
      private static var zd:Number;
      
      private static var y0:Number;
      
      private static var x0:Number;
      
      private static var zAngle:int;
      
      private static var currentColor:int;
      
      private var _colors:Array;
      
      public function FlatShadeMaterial(param1:LightObject3D, param2:uint = 16777215, param3:uint = 0)
      {
         super();
         this.fillAlpha = 1;
         this.light = param1;
         _colors = LightMaps.getFlatMapArray(param2,param3,1);
      }
      
      override public function drawTriangle(param1:Triangle3D, param2:Graphics, param3:RenderSessionData, param4:BitmapData = null, param5:Matrix = null) : void
      {
         lightMatrix = Matrix3D(lightMatrices[param1.instance]);
         zd = param1.faceNormal.x * lightMatrix.n31 + param1.faceNormal.y * lightMatrix.n32 + param1.faceNormal.z * lightMatrix.n33;
         if(zd < 0)
         {
            zd = 0;
         }
         x0 = param1.v0.vertex3DInstance.x;
         y0 = param1.v0.vertex3DInstance.y;
         zAngle = zd * 255;
         currentColor = _colors[zAngle];
         param2.beginFill(currentColor,fillAlpha);
         param2.moveTo(x0,y0);
         param2.lineTo(param1.v1.vertex3DInstance.x,param1.v1.vertex3DInstance.y);
         param2.lineTo(param1.v2.vertex3DInstance.x,param1.v2.vertex3DInstance.y);
         param2.lineTo(x0,y0);
         param2.endFill();
         ++param3.renderStatistics.shadedTriangles;
      }
   }
}

