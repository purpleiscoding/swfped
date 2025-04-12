package org.papervision3d.view.layer
{
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import org.papervision3d.core.log.PaperLogger;
   import org.papervision3d.core.ns.pv3dview;
   import org.papervision3d.core.render.command.RenderableListItem;
   import org.papervision3d.objects.DisplayObject3D;
   import org.papervision3d.view.Viewport3D;
   import org.papervision3d.view.layer.util.ViewportLayerSortMode;
   
   use namespace pv3dview;
   
   public class ViewportLayer extends Sprite
   {
      public var layerIndex:Number;
      
      public var layers:Dictionary = new Dictionary(true);
      
      public var dynamicLayer:Boolean = false;
      
      public var sortMode:String = ViewportLayerSortMode.Z_SORT;
      
      public var weight:Number = 0;
      
      public var childLayers:Array;
      
      public var forceDepth:Boolean = false;
      
      protected var viewport:Viewport3D;
      
      public var screenDepth:Number = 0;
      
      public var displayObject3D:DisplayObject3D;
      
      public var displayObjects:Dictionary = new Dictionary(true);
      
      public var graphicsChannel:Graphics;
      
      public function ViewportLayer(param1:Viewport3D, param2:DisplayObject3D, param3:Boolean = false)
      {
         super();
         this.viewport = param1;
         this.displayObject3D = param2;
         this.dynamicLayer = param3;
         this.graphicsChannel = this.graphics;
         if(param3)
         {
            this.filters = param2.filters;
            this.blendMode = param2.blendMode;
            this.alpha = param2.alpha;
         }
         if(param2)
         {
            addDisplayObject3D(param2);
         }
         init();
      }
      
      public function getLayerObjects(param1:Array = null) : Array
      {
         var _loc2_:DisplayObject3D = null;
         var _loc3_:ViewportLayer = null;
         if(!param1)
         {
            param1 = new Array();
         }
         for each(_loc2_ in this.displayObjects)
         {
            if(Boolean(_loc2_) && _loc2_.parent == null)
            {
               param1.push(_loc2_);
            }
         }
         for each(_loc3_ in childLayers)
         {
            _loc3_.getLayerObjects(param1);
         }
         return param1;
      }
      
      protected function init() : void
      {
         childLayers = new Array();
      }
      
      public function updateInfo() : void
      {
         var _loc1_:ViewportLayer = null;
         for each(_loc1_ in childLayers)
         {
            _loc1_.updateInfo();
            if(!forceDepth)
            {
               this.weight += _loc1_.weight;
               this.screenDepth += _loc1_.screenDepth * _loc1_.weight;
            }
         }
         if(!forceDepth)
         {
            this.screenDepth /= this.weight;
         }
      }
      
      public function sortChildLayers() : void
      {
         if(sortMode == ViewportLayerSortMode.Z_SORT)
         {
            childLayers.sortOn("screenDepth",Array.DESCENDING | Array.NUMERIC);
         }
         else
         {
            childLayers.sortOn("layerIndex",Array.NUMERIC);
         }
         orderLayers();
      }
      
      private function onChildRemoved(param1:ViewportLayerEvent) : void
      {
         if(param1.do3d)
         {
            unlinkChild(param1.do3d,param1);
         }
      }
      
      public function removeAllLayers() : void
      {
         var _loc1_:int = 0;
         _loc1_ = int(childLayers.length - 1);
         while(_loc1_ >= 0)
         {
            removeLayerAt(_loc1_);
            _loc1_--;
         }
      }
      
      public function updateAfterRender() : void
      {
         var _loc1_:ViewportLayer = null;
         for each(_loc1_ in childLayers)
         {
            _loc1_.updateAfterRender();
         }
      }
      
      public function removeLayer(param1:ViewportLayer) : void
      {
         var _loc2_:int = 0;
         _loc2_ = getChildIndex(param1);
         if(_loc2_ > -1)
         {
            removeLayerAt(_loc2_);
         }
         else
         {
            PaperLogger.error("Layer not found for removal.");
         }
      }
      
      protected function getChildLayerFor(param1:DisplayObject3D, param2:Boolean = false) : ViewportLayer
      {
         var _loc3_:ViewportLayer = null;
         if(param1)
         {
            _loc3_ = new ViewportLayer(viewport,param1,param1.useOwnContainer);
            addLayer(_loc3_);
            if(param2)
            {
               param1.addChildrenToLayer(param1,_loc3_);
            }
            return _loc3_;
         }
         PaperLogger.warning("Needs to be a do3d");
         return null;
      }
      
      public function addLayer(param1:ViewportLayer) : void
      {
         var _loc2_:DisplayObject3D = null;
         var _loc3_:ViewportLayer = null;
         childLayers.push(param1);
         addChild(param1);
         param1.addEventListener(ViewportLayerEvent.CHILD_ADDED,onChildAdded);
         param1.addEventListener(ViewportLayerEvent.CHILD_REMOVED,onChildRemoved);
         for each(_loc2_ in param1.displayObjects)
         {
            linkChild(_loc2_,param1);
         }
         for each(_loc3_ in param1.layers)
         {
            for each(_loc2_ in _loc3_.displayObjects)
            {
               linkChild(_loc2_,_loc3_);
            }
         }
      }
      
      public function childLayerIndex(param1:DisplayObject3D) : Number
      {
         var _loc2_:int = 0;
         param1 = !!param1.parentContainer ? param1.parentContainer : param1;
         _loc2_ = 0;
         while(_loc2_ < childLayers.length)
         {
            if(childLayers[_loc2_].hasDisplayObject3D(param1))
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      protected function orderLayers() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < childLayers.length)
         {
            this.setChildIndex(childLayers[_loc1_],_loc1_);
            childLayers[_loc1_].sortChildLayers();
            _loc1_++;
         }
      }
      
      public function removeLayerAt(param1:Number) : void
      {
         var _loc2_:DisplayObject3D = null;
         for each(_loc2_ in childLayers[param1].displayObjects)
         {
            unlinkChild(_loc2_);
         }
         removeChild(childLayers[param1]);
         childLayers.splice(param1,1);
      }
      
      protected function reset() : void
      {
         if(!forceDepth)
         {
            screenDepth = 0;
         }
         this.weight = 0;
      }
      
      private function linkChild(param1:DisplayObject3D, param2:ViewportLayer, param3:ViewportLayerEvent = null) : void
      {
         layers[param1] = param2;
         dispatchEvent(new ViewportLayerEvent(ViewportLayerEvent.CHILD_ADDED,param1,param2));
      }
      
      public function updateBeforeRender() : void
      {
         var _loc1_:ViewportLayer = null;
         clear();
         for each(_loc1_ in childLayers)
         {
            _loc1_.updateBeforeRender();
         }
      }
      
      private function onChildAdded(param1:ViewportLayerEvent) : void
      {
         if(param1.do3d)
         {
            linkChild(param1.do3d,param1.layer,param1);
         }
      }
      
      public function getChildLayer(param1:DisplayObject3D, param2:Boolean = true, param3:Boolean = false) : ViewportLayer
      {
         param1 = !!param1.parentContainer ? param1.parentContainer : param1;
         if(layers[param1])
         {
            return layers[param1];
         }
         if(param2)
         {
            return getChildLayerFor(param1,param3);
         }
         return null;
      }
      
      public function processRenderItem(param1:RenderableListItem) : void
      {
         if(!forceDepth)
         {
            this.screenDepth += param1.screenDepth;
            ++this.weight;
         }
      }
      
      public function clear() : void
      {
         graphicsChannel.clear();
         reset();
      }
      
      public function removeDisplayObject3D(param1:DisplayObject3D) : void
      {
         displayObjects[param1] = null;
         dispatchEvent(new ViewportLayerEvent(ViewportLayerEvent.CHILD_REMOVED,param1,this));
      }
      
      private function unlinkChild(param1:DisplayObject3D, param2:ViewportLayerEvent = null) : void
      {
         layers[param1] = null;
         dispatchEvent(new ViewportLayerEvent(ViewportLayerEvent.CHILD_REMOVED,param1));
      }
      
      public function addDisplayObject3D(param1:DisplayObject3D, param2:Boolean = false) : void
      {
         if(!param1)
         {
            return;
         }
         displayObjects[param1] = param1;
         dispatchEvent(new ViewportLayerEvent(ViewportLayerEvent.CHILD_ADDED,param1,this));
         if(param2)
         {
            param1.addChildrenToLayer(param1,this);
         }
      }
      
      public function hasDisplayObject3D(param1:DisplayObject3D) : Boolean
      {
         return displayObjects[param1] != null;
      }
   }
}

