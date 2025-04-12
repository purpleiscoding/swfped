package fl.controls
{
   import fl.core.InvalidationType;
   import fl.core.UIComponent;
   import fl.events.ComponentEvent;
   import fl.events.ScrollEvent;
   import fl.managers.IFocusManager;
   import fl.managers.IFocusManagerComponent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.system.IME;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.text.TextLineMetrics;
   import flash.ui.Keyboard;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol107")]
   public class TextArea extends UIComponent implements IFocusManagerComponent
   {
      public static var createAccessibilityImplementation:Function;
      
      private static var defaultStyles:Object = {
         "upSkin":"TextArea_upSkin",
         "disabledSkin":"TextArea_disabledSkin",
         "focusRectSkin":null,
         "focusRectPadding":null,
         "textFormat":null,
         "disabledTextFormat":null,
         "textPadding":3,
         "embedFonts":false
      };
      
      protected static const SCROLL_BAR_STYLES:Object = {
         "downArrowDisabledSkin":"downArrowDisabledSkin",
         "downArrowDownSkin":"downArrowDownSkin",
         "downArrowOverSkin":"downArrowOverSkin",
         "downArrowUpSkin":"downArrowUpSkin",
         "upArrowDisabledSkin":"upArrowDisabledSkin",
         "upArrowDownSkin":"upArrowDownSkin",
         "upArrowOverSkin":"upArrowOverSkin",
         "upArrowUpSkin":"upArrowUpSkin",
         "thumbDisabledSkin":"thumbDisabledSkin",
         "thumbDownSkin":"thumbDownSkin",
         "thumbOverSkin":"thumbOverSkin",
         "thumbUpSkin":"thumbUpSkin",
         "thumbIcon":"thumbIcon",
         "trackDisabledSkin":"trackDisabledSkin",
         "trackDownSkin":"trackDownSkin",
         "trackOverSkin":"trackOverSkin",
         "trackUpSkin":"trackUpSkin",
         "repeatDelay":"repeatDelay",
         "repeatInterval":"repeatInterval"
      };
      
      protected var _html:Boolean = false;
      
      protected var _verticalScrollBar:UIScrollBar;
      
      protected var _savedHTML:String;
      
      protected var background:DisplayObject;
      
      protected var _horizontalScrollBar:UIScrollBar;
      
      protected var _horizontalScrollPolicy:String = ScrollPolicy.AUTO;
      
      protected var _editable:Boolean = true;
      
      protected var textHasChanged:Boolean = false;
      
      public var textField:TextField;
      
      protected var _wordWrap:Boolean = true;
      
      protected var _verticalScrollPolicy:String = ScrollPolicy.AUTO;
      
      public function TextArea()
      {
         super();
      }
      
      public static function getStyleDefinition() : Object
      {
         return UIComponent.mergeStyles(defaultStyles,ScrollBar.getStyleDefinition());
      }
      
      override public function drawFocus(param1:Boolean) : void
      {
         if(focusTarget != null)
         {
            focusTarget.drawFocus(param1);
            return;
         }
         super.drawFocus(param1);
      }
      
      public function set imeMode(param1:String) : void
      {
         _imeMode = param1;
      }
      
      protected function handleWheel(param1:MouseEvent) : void
      {
         if(!enabled || !_verticalScrollBar.visible)
         {
            return;
         }
         _verticalScrollBar.scrollPosition -= param1.delta * _verticalScrollBar.lineScrollSize;
         dispatchEvent(new ScrollEvent(ScrollBarDirection.VERTICAL,param1.delta * _verticalScrollBar.lineScrollSize,_verticalScrollBar.scrollPosition));
      }
      
      public function get verticalScrollPosition() : Number
      {
         return textField.scrollV;
      }
      
      override protected function isOurFocus(param1:DisplayObject) : Boolean
      {
         return param1 == textField || super.isOurFocus(param1);
      }
      
      public function set verticalScrollPosition(param1:Number) : void
      {
         drawNow();
         textField.scrollV = param1;
      }
      
      protected function handleKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            dispatchEvent(new ComponentEvent(ComponentEvent.ENTER,true));
         }
      }
      
      public function set text(param1:String) : void
      {
         if(componentInspectorSetting && param1 == "")
         {
            return;
         }
         textField.text = param1;
         _html = false;
         invalidate(InvalidationType.DATA);
         invalidate(InvalidationType.STYLES);
         textHasChanged = true;
      }
      
      protected function updateTextFieldType() : void
      {
         textField.type = enabled && _editable ? TextFieldType.INPUT : TextFieldType.DYNAMIC;
         textField.selectable = enabled;
         textField.wordWrap = _wordWrap;
         textField.multiline = true;
      }
      
      public function get selectionEndIndex() : int
      {
         return textField.selectionEndIndex;
      }
      
      public function get editable() : Boolean
      {
         return _editable;
      }
      
      override protected function focusInHandler(param1:FocusEvent) : void
      {
         var _loc2_:IFocusManager = null;
         setIMEMode(true);
         if(param1.target == this)
         {
            stage.focus = textField;
         }
         _loc2_ = focusManager;
         if(_loc2_)
         {
            if(editable)
            {
               _loc2_.showFocusIndicator = true;
            }
            _loc2_.defaultButtonEnabled = false;
         }
         super.focusInHandler(param1);
         if(editable)
         {
            setIMEMode(true);
         }
      }
      
      public function get wordWrap() : Boolean
      {
         return _wordWrap;
      }
      
      public function get selectionBeginIndex() : int
      {
         return textField.selectionBeginIndex;
      }
      
      public function get horizontalScrollBar() : UIScrollBar
      {
         return _horizontalScrollBar;
      }
      
      public function set alwaysShowSelection(param1:Boolean) : void
      {
         textField.alwaysShowSelection = param1;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         mouseChildren = enabled;
         invalidate(InvalidationType.STATE);
      }
      
      protected function setEmbedFont() : *
      {
         var _loc1_:Object = null;
         _loc1_ = getStyleValue("embedFonts");
         if(_loc1_ != null)
         {
            textField.embedFonts = _loc1_;
         }
      }
      
      public function get horizontalScrollPosition() : Number
      {
         return textField.scrollH;
      }
      
      public function set condenseWhite(param1:Boolean) : void
      {
         textField.condenseWhite = param1;
         invalidate(InvalidationType.DATA);
      }
      
      public function get horizontalScrollPolicy() : String
      {
         return _horizontalScrollPolicy;
      }
      
      public function set displayAsPassword(param1:Boolean) : void
      {
         textField.displayAsPassword = param1;
      }
      
      public function get maxVerticalScrollPosition() : int
      {
         return textField.maxScrollV;
      }
      
      public function set horizontalScrollPosition(param1:Number) : void
      {
         drawNow();
         textField.scrollH = param1;
      }
      
      public function get textHeight() : Number
      {
         drawNow();
         return textField.textHeight;
      }
      
      public function get textWidth() : Number
      {
         drawNow();
         return textField.textWidth;
      }
      
      public function get restrict() : String
      {
         return textField.restrict;
      }
      
      public function set editable(param1:Boolean) : void
      {
         _editable = param1;
         invalidate(InvalidationType.STATE);
      }
      
      protected function updateScrollBars() : *
      {
         _horizontalScrollBar.update();
         _verticalScrollBar.update();
         _verticalScrollBar.enabled = enabled;
         _horizontalScrollBar.enabled = enabled;
         _horizontalScrollBar.drawNow();
         _verticalScrollBar.drawNow();
      }
      
      public function get maxChars() : int
      {
         return textField.maxChars;
      }
      
      public function get length() : Number
      {
         return textField.text.length;
      }
      
      public function set wordWrap(param1:Boolean) : void
      {
         _wordWrap = param1;
         invalidate(InvalidationType.STATE);
      }
      
      public function get verticalScrollPolicy() : String
      {
         return _verticalScrollPolicy;
      }
      
      public function getLineMetrics(param1:int) : TextLineMetrics
      {
         return textField.getLineMetrics(param1);
      }
      
      public function get imeMode() : String
      {
         return IME.conversionMode;
      }
      
      protected function handleScroll(param1:ScrollEvent) : void
      {
         dispatchEvent(param1);
      }
      
      override protected function focusOutHandler(param1:FocusEvent) : void
      {
         var _loc2_:IFocusManager = null;
         _loc2_ = focusManager;
         if(_loc2_)
         {
            _loc2_.defaultButtonEnabled = true;
         }
         setSelection(0,0);
         super.focusOutHandler(param1);
         if(editable)
         {
            setIMEMode(false);
         }
      }
      
      protected function delayedLayoutUpdate(param1:Event) : void
      {
         if(textHasChanged)
         {
            textHasChanged = false;
            drawLayout();
            return;
         }
         removeEventListener(Event.ENTER_FRAME,delayedLayoutUpdate);
      }
      
      public function set htmlText(param1:String) : void
      {
         if(componentInspectorSetting && param1 == "")
         {
            return;
         }
         if(param1 == "")
         {
            text = "";
            return;
         }
         _html = true;
         _savedHTML = param1;
         textField.htmlText = param1;
         invalidate(InvalidationType.DATA);
         invalidate(InvalidationType.STYLES);
         textHasChanged = true;
      }
      
      public function get text() : String
      {
         return textField.text;
      }
      
      public function get verticalScrollBar() : UIScrollBar
      {
         return _verticalScrollBar;
      }
      
      override public function get enabled() : Boolean
      {
         return super.enabled;
      }
      
      public function get condenseWhite() : Boolean
      {
         return textField.condenseWhite;
      }
      
      public function set horizontalScrollPolicy(param1:String) : void
      {
         _horizontalScrollPolicy = param1;
         invalidate(InvalidationType.SIZE);
      }
      
      public function get displayAsPassword() : Boolean
      {
         return textField.displayAsPassword;
      }
      
      override protected function draw() : void
      {
         if(isInvalid(InvalidationType.STATE))
         {
            updateTextFieldType();
         }
         if(isInvalid(InvalidationType.STYLES))
         {
            setStyles();
            setEmbedFont();
         }
         if(isInvalid(InvalidationType.STYLES,InvalidationType.STATE))
         {
            drawTextFormat();
            drawBackground();
            invalidate(InvalidationType.SIZE,false);
         }
         if(isInvalid(InvalidationType.SIZE,InvalidationType.DATA))
         {
            drawLayout();
         }
         super.draw();
      }
      
      protected function handleTextInput(param1:TextEvent) : void
      {
         param1.stopPropagation();
         dispatchEvent(new TextEvent(TextEvent.TEXT_INPUT,true,false,param1.text));
      }
      
      override protected function configUI() : void
      {
         super.configUI();
         tabChildren = true;
         textField = new TextField();
         addChild(textField);
         updateTextFieldType();
         _verticalScrollBar = new UIScrollBar();
         _verticalScrollBar.name = "V";
         _verticalScrollBar.visible = false;
         _verticalScrollBar.focusEnabled = false;
         copyStylesToChild(_verticalScrollBar,SCROLL_BAR_STYLES);
         _verticalScrollBar.addEventListener(ScrollEvent.SCROLL,handleScroll,false,0,true);
         addChild(_verticalScrollBar);
         _horizontalScrollBar = new UIScrollBar();
         _horizontalScrollBar.name = "H";
         _horizontalScrollBar.visible = false;
         _horizontalScrollBar.focusEnabled = false;
         _horizontalScrollBar.direction = ScrollBarDirection.HORIZONTAL;
         copyStylesToChild(_horizontalScrollBar,SCROLL_BAR_STYLES);
         _horizontalScrollBar.addEventListener(ScrollEvent.SCROLL,handleScroll,false,0,true);
         addChild(_horizontalScrollBar);
         textField.addEventListener(TextEvent.TEXT_INPUT,handleTextInput,false,0,true);
         textField.addEventListener(Event.CHANGE,handleChange,false,0,true);
         textField.addEventListener(KeyboardEvent.KEY_DOWN,handleKeyDown,false,0,true);
         _horizontalScrollBar.scrollTarget = textField;
         _verticalScrollBar.scrollTarget = textField;
         addEventListener(MouseEvent.MOUSE_WHEEL,handleWheel,false,0,true);
      }
      
      protected function setTextSize(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         _loc4_ = param1 - param3 * 2;
         _loc5_ = param2 - param3 * 2;
         if(_loc4_ != textField.width)
         {
            textField.width = _loc4_;
         }
         if(_loc5_ != textField.height)
         {
            textField.height = _loc5_;
         }
      }
      
      public function appendText(param1:String) : void
      {
         textField.appendText(param1);
         invalidate(InvalidationType.DATA);
      }
      
      protected function needVScroll() : Boolean
      {
         if(_verticalScrollPolicy == ScrollPolicy.OFF)
         {
            return false;
         }
         if(_verticalScrollPolicy == ScrollPolicy.ON)
         {
            return true;
         }
         return textField.maxScrollV > 1;
      }
      
      public function setSelection(param1:int, param2:int) : void
      {
         textField.setSelection(param1,param2);
      }
      
      public function get alwaysShowSelection() : Boolean
      {
         return textField.alwaysShowSelection;
      }
      
      public function get htmlText() : String
      {
         return textField.htmlText;
      }
      
      public function set restrict(param1:String) : void
      {
         if(componentInspectorSetting && param1 == "")
         {
            param1 = null;
         }
         textField.restrict = param1;
      }
      
      protected function drawBackground() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:String = null;
         _loc1_ = background;
         _loc2_ = enabled ? "upSkin" : "disabledSkin";
         background = getDisplayObjectInstance(getStyleValue(_loc2_));
         if(background != null)
         {
            addChildAt(background,0);
         }
         if(_loc1_ != null && _loc1_ != background && contains(_loc1_))
         {
            removeChild(_loc1_);
         }
      }
      
      public function set maxChars(param1:int) : void
      {
         textField.maxChars = param1;
      }
      
      public function get maxHorizontalScrollPosition() : int
      {
         return textField.maxScrollH;
      }
      
      protected function drawLayout() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Boolean = false;
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         _loc1_ = Number(getStyleValue("textPadding"));
         textField.x = textField.y = _loc1_;
         background.width = width;
         background.height = height;
         _loc2_ = height;
         _loc3_ = needVScroll();
         _loc4_ = width - (_loc3_ ? _verticalScrollBar.width : 0);
         _loc5_ = needHScroll();
         if(_loc5_)
         {
            _loc2_ -= _horizontalScrollBar.height;
         }
         setTextSize(_loc4_,_loc2_,_loc1_);
         if(_loc5_ && !_loc3_ && needVScroll())
         {
            _loc3_ = true;
            _loc4_ -= _verticalScrollBar.width;
            setTextSize(_loc4_,_loc2_,_loc1_);
         }
         if(_loc3_)
         {
            _verticalScrollBar.visible = true;
            _verticalScrollBar.x = width - _verticalScrollBar.width;
            _verticalScrollBar.height = _loc2_;
            _verticalScrollBar.visible = true;
            _verticalScrollBar.enabled = enabled;
         }
         else
         {
            _verticalScrollBar.visible = false;
         }
         if(_loc5_)
         {
            _horizontalScrollBar.visible = true;
            _horizontalScrollBar.y = height - _horizontalScrollBar.height;
            _horizontalScrollBar.width = _loc4_;
            _horizontalScrollBar.visible = true;
            _horizontalScrollBar.enabled = enabled;
         }
         else
         {
            _horizontalScrollBar.visible = false;
         }
         updateScrollBars();
         addEventListener(Event.ENTER_FRAME,delayedLayoutUpdate,false,0,true);
      }
      
      protected function setStyles() : void
      {
         copyStylesToChild(_verticalScrollBar,SCROLL_BAR_STYLES);
         copyStylesToChild(_horizontalScrollBar,SCROLL_BAR_STYLES);
      }
      
      protected function needHScroll() : Boolean
      {
         if(_horizontalScrollPolicy == ScrollPolicy.OFF)
         {
            return false;
         }
         if(_horizontalScrollPolicy == ScrollPolicy.ON)
         {
            return true;
         }
         return textField.maxScrollH > 0;
      }
      
      protected function drawTextFormat() : void
      {
         var _loc1_:Object = null;
         var _loc2_:TextFormat = null;
         var _loc3_:TextFormat = null;
         _loc1_ = UIComponent.getStyleDefinition();
         _loc2_ = enabled ? _loc1_.defaultTextFormat as TextFormat : _loc1_.defaultDisabledTextFormat as TextFormat;
         textField.setTextFormat(_loc2_);
         _loc3_ = getStyleValue(enabled ? "textFormat" : "disabledTextFormat") as TextFormat;
         if(_loc3_ != null)
         {
            textField.setTextFormat(_loc3_);
         }
         else
         {
            _loc3_ = _loc2_;
         }
         textField.defaultTextFormat = _loc3_;
         setEmbedFont();
         if(_html)
         {
            textField.htmlText = _savedHTML;
         }
      }
      
      public function set verticalScrollPolicy(param1:String) : void
      {
         _verticalScrollPolicy = param1;
         invalidate(InvalidationType.SIZE);
      }
      
      protected function handleChange(param1:Event) : void
      {
         param1.stopPropagation();
         dispatchEvent(new Event(Event.CHANGE,true));
         invalidate(InvalidationType.DATA);
      }
   }
}

