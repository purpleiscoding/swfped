package fl.controls
{
   import fl.containers.BaseScrollPane;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ICellRenderer;
   import fl.core.InvalidationType;
   import fl.data.DataProvider;
   import fl.data.SimpleCollectionItem;
   import fl.events.DataChangeEvent;
   import fl.events.DataChangeType;
   import fl.events.ListEvent;
   import fl.events.ScrollEvent;
   import fl.managers.IFocusManagerComponent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   
   public class SelectableList extends BaseScrollPane implements IFocusManagerComponent
   {
      public static var createAccessibilityImplementation:Function;
      
      private static var defaultStyles:Object = {
         "skin":"List_skin",
         "cellRenderer":CellRenderer,
         "contentPadding":null,
         "disabledAlpha":null
      };
      
      protected var invalidItems:Dictionary;
      
      protected var renderedItems:Dictionary;
      
      protected var listHolder:Sprite;
      
      protected var _allowMultipleSelection:Boolean = false;
      
      protected var lastCaretIndex:int = -1;
      
      protected var _selectedIndices:Array;
      
      protected var availableCellRenderers:Array;
      
      protected var list:Sprite;
      
      protected var caretIndex:int = -1;
      
      protected var updatedRendererStyles:Object;
      
      protected var preChangeItems:Array;
      
      protected var activeCellRenderers:Array;
      
      protected var rendererStyles:Object;
      
      protected var _verticalScrollPosition:Number;
      
      protected var _dataProvider:DataProvider;
      
      protected var _horizontalScrollPosition:Number;
      
      private var collectionItemImport:SimpleCollectionItem;
      
      protected var _selectable:Boolean = true;
      
      public function SelectableList()
      {
         super();
         activeCellRenderers = [];
         availableCellRenderers = [];
         invalidItems = new Dictionary(true);
         renderedItems = new Dictionary(true);
         _selectedIndices = [];
         if(dataProvider == null)
         {
            dataProvider = new DataProvider();
         }
         verticalScrollPolicy = ScrollPolicy.AUTO;
         rendererStyles = {};
         updatedRendererStyles = {};
      }
      
      public static function getStyleDefinition() : Object
      {
         return mergeStyles(defaultStyles,BaseScrollPane.getStyleDefinition());
      }
      
      protected function drawList() : void
      {
      }
      
      public function set allowMultipleSelection(param1:Boolean) : void
      {
         if(param1 == _allowMultipleSelection)
         {
            return;
         }
         _allowMultipleSelection = param1;
         if(!param1 && _selectedIndices.length > 1)
         {
            _selectedIndices = [_selectedIndices.pop()];
            invalidate(InvalidationType.DATA);
         }
      }
      
      public function sortItemsOn(param1:String, param2:Object = null) : *
      {
         return _dataProvider.sortOn(param1,param2);
      }
      
      public function removeItemAt(param1:uint) : Object
      {
         return _dataProvider.removeItemAt(param1);
      }
      
      public function get selectedItem() : Object
      {
         return _selectedIndices.length == 0 ? null : _dataProvider.getItemAt(selectedIndex);
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         if(!selectable)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case Keyboard.UP:
            case Keyboard.DOWN:
            case Keyboard.END:
            case Keyboard.HOME:
            case Keyboard.PAGE_UP:
            case Keyboard.PAGE_DOWN:
               moveSelectionVertically(param1.keyCode,param1.shiftKey && _allowMultipleSelection,param1.ctrlKey && _allowMultipleSelection);
               param1.stopPropagation();
               break;
            case Keyboard.LEFT:
            case Keyboard.RIGHT:
               moveSelectionHorizontally(param1.keyCode,param1.shiftKey && _allowMultipleSelection,param1.ctrlKey && _allowMultipleSelection);
               param1.stopPropagation();
         }
      }
      
      public function get selectable() : Boolean
      {
         return _selectable;
      }
      
      public function itemToCellRenderer(param1:Object) : ICellRenderer
      {
         var _loc2_:* = undefined;
         var _loc3_:ICellRenderer = null;
         if(param1 != null)
         {
            for(_loc2_ in activeCellRenderers)
            {
               _loc3_ = activeCellRenderers[_loc2_] as ICellRenderer;
               if(_loc3_.data == param1)
               {
                  return _loc3_;
               }
            }
         }
         return null;
      }
      
      public function getNextIndexAtLetter(param1:String, param2:int = -1) : int
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Object = null;
         var _loc7_:String = null;
         if(length == 0)
         {
            return -1;
         }
         param1 = param1.toUpperCase();
         _loc3_ = int(length - 1);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param2 + 1 + _loc4_;
            if(_loc5_ > length - 1)
            {
               _loc5_ -= length;
            }
            _loc6_ = getItemAt(_loc5_);
            if(_loc6_ == null)
            {
               break;
            }
            _loc7_ = itemToLabel(_loc6_);
            if(_loc7_ != null)
            {
               if(_loc7_.charAt(0).toUpperCase() == param1)
               {
                  return _loc5_;
               }
            }
            _loc4_++;
         }
         return -1;
      }
      
      public function invalidateList() : void
      {
         _invalidateList();
         invalidate(InvalidationType.DATA);
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         list.mouseChildren = _enabled;
      }
      
      public function get selectedIndices() : Array
      {
         return _selectedIndices.concat();
      }
      
      public function set selectable(param1:Boolean) : void
      {
         if(param1 == _selectable)
         {
            return;
         }
         if(!param1)
         {
            selectedIndices = [];
         }
         _selectable = param1;
      }
      
      public function itemToLabel(param1:Object) : String
      {
         return param1["label"];
      }
      
      public function addItemAt(param1:Object, param2:uint) : void
      {
         _dataProvider.addItemAt(param1,param2);
         invalidateList();
      }
      
      public function replaceItemAt(param1:Object, param2:uint) : Object
      {
         return _dataProvider.replaceItemAt(param1,param2);
      }
      
      protected function handleDataChange(param1:DataChangeEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:uint = 0;
         _loc2_ = int(param1.startIndex);
         _loc3_ = int(param1.endIndex);
         _loc4_ = param1.changeType;
         if(_loc4_ == DataChangeType.INVALIDATE_ALL)
         {
            clearSelection();
            invalidateList();
         }
         else if(_loc4_ == DataChangeType.INVALIDATE)
         {
            _loc5_ = 0;
            while(_loc5_ < param1.items.length)
            {
               invalidateItem(param1.items[_loc5_]);
               _loc5_++;
            }
         }
         else if(_loc4_ == DataChangeType.ADD)
         {
            _loc5_ = 0;
            while(_loc5_ < _selectedIndices.length)
            {
               if(_selectedIndices[_loc5_] >= _loc2_)
               {
                  _selectedIndices[_loc5_] += _loc2_ - _loc3_;
               }
               _loc5_++;
            }
         }
         else if(_loc4_ == DataChangeType.REMOVE)
         {
            _loc5_ = 0;
            while(_loc5_ < _selectedIndices.length)
            {
               if(_selectedIndices[_loc5_] >= _loc2_)
               {
                  if(_selectedIndices[_loc5_] <= _loc3_)
                  {
                     delete _selectedIndices[_loc5_];
                  }
                  else
                  {
                     _selectedIndices[_loc5_] -= _loc2_ - _loc3_ + 1;
                  }
               }
               _loc5_++;
            }
         }
         else if(_loc4_ == DataChangeType.REMOVE_ALL)
         {
            clearSelection();
         }
         else if(_loc4_ != DataChangeType.REPLACE)
         {
            selectedItems = preChangeItems;
            preChangeItems = null;
         }
         invalidate(InvalidationType.DATA);
      }
      
      protected function _invalidateList() : void
      {
         availableCellRenderers = [];
         while(activeCellRenderers.length > 0)
         {
            list.removeChild(activeCellRenderers.pop() as DisplayObject);
         }
      }
      
      protected function updateRendererStyles() : void
      {
         var _loc1_:Array = null;
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:String = null;
         _loc1_ = availableCellRenderers.concat(activeCellRenderers);
         _loc2_ = _loc1_.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc1_[_loc3_].setStyle != null)
            {
               for(_loc4_ in updatedRendererStyles)
               {
                  _loc1_[_loc3_].setStyle(_loc4_,updatedRendererStyles[_loc4_]);
               }
               _loc1_[_loc3_].drawNow();
            }
            _loc3_++;
         }
         updatedRendererStyles = {};
      }
      
      public function set selectedItem(param1:Object) : void
      {
         var _loc2_:int = 0;
         _loc2_ = _dataProvider.getItemIndex(param1);
         selectedIndex = _loc2_;
      }
      
      public function sortItems(... rest) : *
      {
         return _dataProvider.sort.apply(_dataProvider,rest);
      }
      
      public function removeAll() : void
      {
         _dataProvider.removeAll();
      }
      
      protected function handleCellRendererChange(param1:Event) : void
      {
         var _loc2_:ICellRenderer = null;
         var _loc3_:uint = 0;
         _loc2_ = param1.currentTarget as ICellRenderer;
         _loc3_ = _loc2_.listData.index;
         _dataProvider.invalidateItemAt(_loc3_);
      }
      
      protected function moveSelectionVertically(param1:uint, param2:Boolean, param3:Boolean) : void
      {
      }
      
      override protected function setHorizontalScrollPosition(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:Number = NaN;
         if(param1 == _horizontalScrollPosition)
         {
            return;
         }
         _loc3_ = param1 - _horizontalScrollPosition;
         _horizontalScrollPosition = param1;
         if(param2)
         {
            dispatchEvent(new ScrollEvent(ScrollBarDirection.HORIZONTAL,_loc3_,param1));
         }
      }
      
      public function scrollToSelected() : void
      {
         scrollToIndex(selectedIndex);
      }
      
      public function invalidateItem(param1:Object) : void
      {
         if(renderedItems[param1] == null)
         {
            return;
         }
         invalidItems[param1] = true;
         invalidate(InvalidationType.DATA);
      }
      
      protected function handleCellRendererClick(param1:MouseEvent) : void
      {
         var _loc2_:ICellRenderer = null;
         var _loc3_:uint = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:uint = 0;
         if(!_enabled)
         {
            return;
         }
         _loc2_ = param1.currentTarget as ICellRenderer;
         _loc3_ = _loc2_.listData.index;
         if(!dispatchEvent(new ListEvent(ListEvent.ITEM_CLICK,false,true,_loc2_.listData.column,_loc2_.listData.row,_loc3_,_loc2_.data)) || !_selectable)
         {
            return;
         }
         _loc4_ = int(selectedIndices.indexOf(_loc3_));
         if(!_allowMultipleSelection)
         {
            if(_loc4_ != -1)
            {
               return;
            }
            _loc2_.selected = true;
            _selectedIndices = [_loc3_];
            lastCaretIndex = caretIndex = _loc3_;
         }
         else if(param1.shiftKey)
         {
            _loc6_ = _selectedIndices.length > 0 ? uint(_selectedIndices[0]) : _loc3_;
            _selectedIndices = [];
            if(_loc6_ > _loc3_)
            {
               _loc5_ = int(_loc6_);
               while(_loc5_ >= _loc3_)
               {
                  _selectedIndices.push(_loc5_);
                  _loc5_--;
               }
            }
            else
            {
               _loc5_ = int(_loc6_);
               while(_loc5_ <= _loc3_)
               {
                  _selectedIndices.push(_loc5_);
                  _loc5_++;
               }
            }
            caretIndex = _loc3_;
         }
         else if(param1.ctrlKey)
         {
            if(_loc4_ != -1)
            {
               _loc2_.selected = false;
               _selectedIndices.splice(_loc4_,1);
            }
            else
            {
               _loc2_.selected = true;
               _selectedIndices.push(_loc3_);
            }
            caretIndex = _loc3_;
         }
         else
         {
            _selectedIndices = [_loc3_];
            lastCaretIndex = caretIndex = _loc3_;
         }
         dispatchEvent(new Event(Event.CHANGE));
         invalidate(InvalidationType.DATA);
      }
      
      public function get length() : uint
      {
         return _dataProvider.length;
      }
      
      public function get allowMultipleSelection() : Boolean
      {
         return _allowMultipleSelection;
      }
      
      protected function onPreChange(param1:DataChangeEvent) : void
      {
         switch(param1.changeType)
         {
            case DataChangeType.REMOVE:
            case DataChangeType.ADD:
            case DataChangeType.INVALIDATE:
            case DataChangeType.REMOVE_ALL:
            case DataChangeType.REPLACE:
            case DataChangeType.INVALIDATE_ALL:
               break;
            default:
               preChangeItems = selectedItems;
         }
      }
      
      public function getRendererStyle(param1:String, param2:int = -1) : Object
      {
         return rendererStyles[param1];
      }
      
      override protected function setVerticalScrollPosition(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:Number = NaN;
         if(param1 == _verticalScrollPosition)
         {
            return;
         }
         _loc3_ = param1 - _verticalScrollPosition;
         _verticalScrollPosition = param1;
         if(param2)
         {
            dispatchEvent(new ScrollEvent(ScrollBarDirection.VERTICAL,_loc3_,param1));
         }
      }
      
      protected function moveSelectionHorizontally(param1:uint, param2:Boolean, param3:Boolean) : void
      {
      }
      
      public function set selectedIndices(param1:Array) : void
      {
         if(!_selectable)
         {
            return;
         }
         _selectedIndices = param1 == null ? [] : param1.concat();
         invalidate(InvalidationType.SELECTED);
      }
      
      public function get selectedIndex() : int
      {
         return _selectedIndices.length == 0 ? -1 : int(_selectedIndices[_selectedIndices.length - 1]);
      }
      
      override protected function draw() : void
      {
         super.draw();
      }
      
      override protected function configUI() : void
      {
         super.configUI();
         listHolder = new Sprite();
         addChild(listHolder);
         listHolder.scrollRect = contentScrollRect;
         list = new Sprite();
         listHolder.addChild(list);
      }
      
      public function addItem(param1:Object) : void
      {
         _dataProvider.addItem(param1);
         invalidateList();
      }
      
      protected function handleCellRendererMouseEvent(param1:MouseEvent) : void
      {
         var _loc2_:ICellRenderer = null;
         var _loc3_:String = null;
         _loc2_ = param1.target as ICellRenderer;
         _loc3_ = param1.type == MouseEvent.ROLL_OVER ? ListEvent.ITEM_ROLL_OVER : ListEvent.ITEM_ROLL_OUT;
         dispatchEvent(new ListEvent(_loc3_,false,false,_loc2_.listData.column,_loc2_.listData.row,_loc2_.listData.index,_loc2_.data));
      }
      
      public function clearRendererStyle(param1:String, param2:int = -1) : void
      {
         delete rendererStyles[param1];
         updatedRendererStyles[param1] = null;
         invalidate(InvalidationType.RENDERER_STYLES);
      }
      
      protected function handleCellRendererDoubleClick(param1:MouseEvent) : void
      {
         var _loc2_:ICellRenderer = null;
         var _loc3_:uint = 0;
         if(!_enabled)
         {
            return;
         }
         _loc2_ = param1.currentTarget as ICellRenderer;
         _loc3_ = _loc2_.listData.index;
         dispatchEvent(new ListEvent(ListEvent.ITEM_DOUBLE_CLICK,false,true,_loc2_.listData.column,_loc2_.listData.row,_loc3_,_loc2_.data));
      }
      
      public function get rowCount() : uint
      {
         return 0;
      }
      
      public function isItemSelected(param1:Object) : Boolean
      {
         return selectedItems.indexOf(param1) > -1;
      }
      
      public function set dataProvider(param1:DataProvider) : void
      {
         if(_dataProvider != null)
         {
            _dataProvider.removeEventListener(DataChangeEvent.DATA_CHANGE,handleDataChange);
            _dataProvider.removeEventListener(DataChangeEvent.PRE_DATA_CHANGE,onPreChange);
         }
         _dataProvider = param1;
         _dataProvider.addEventListener(DataChangeEvent.DATA_CHANGE,handleDataChange,false,0,true);
         _dataProvider.addEventListener(DataChangeEvent.PRE_DATA_CHANGE,onPreChange,false,0,true);
         clearSelection();
         invalidateList();
      }
      
      override protected function drawLayout() : void
      {
         super.drawLayout();
         contentScrollRect = listHolder.scrollRect;
         contentScrollRect.width = availableWidth;
         contentScrollRect.height = availableHeight;
         listHolder.scrollRect = contentScrollRect;
      }
      
      public function getItemAt(param1:uint) : Object
      {
         return _dataProvider.getItemAt(param1);
      }
      
      override protected function initializeAccessibility() : void
      {
         if(SelectableList.createAccessibilityImplementation != null)
         {
            SelectableList.createAccessibilityImplementation(this);
         }
      }
      
      public function scrollToIndex(param1:int) : void
      {
      }
      
      public function removeItem(param1:Object) : Object
      {
         return _dataProvider.removeItem(param1);
      }
      
      public function get dataProvider() : DataProvider
      {
         return _dataProvider;
      }
      
      public function set maxHorizontalScrollPosition(param1:Number) : void
      {
         _maxHorizontalScrollPosition = param1;
         invalidate(InvalidationType.SIZE);
      }
      
      public function setRendererStyle(param1:String, param2:Object, param3:uint = 0) : void
      {
         if(rendererStyles[param1] == param2)
         {
            return;
         }
         updatedRendererStyles[param1] = param2;
         rendererStyles[param1] = param2;
         invalidate(InvalidationType.RENDERER_STYLES);
      }
      
      public function invalidateItemAt(param1:uint) : void
      {
         var _loc2_:Object = null;
         _loc2_ = _dataProvider.getItemAt(param1);
         if(_loc2_ != null)
         {
            invalidateItem(_loc2_);
         }
      }
      
      public function set selectedItems(param1:Array) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:int = 0;
         if(param1 == null)
         {
            selectedIndices = null;
            return;
         }
         _loc2_ = [];
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = _dataProvider.getItemIndex(param1[_loc3_]);
            if(_loc4_ != -1)
            {
               _loc2_.push(_loc4_);
            }
            _loc3_++;
         }
         selectedIndices = _loc2_;
      }
      
      public function clearSelection() : void
      {
         selectedIndex = -1;
      }
      
      override public function get maxHorizontalScrollPosition() : Number
      {
         return _maxHorizontalScrollPosition;
      }
      
      public function get selectedItems() : Array
      {
         var _loc1_:Array = null;
         var _loc2_:uint = 0;
         _loc1_ = [];
         _loc2_ = 0;
         while(_loc2_ < _selectedIndices.length)
         {
            _loc1_.push(_dataProvider.getItemAt(_selectedIndices[_loc2_]));
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         selectedIndices = param1 == -1 ? null : [param1];
      }
   }
}

