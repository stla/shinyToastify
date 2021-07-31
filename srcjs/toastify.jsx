import { reactShinyInput } from "reactR";
import { ToastContainer, toast, Slide, Zoom, Flip, Bounce } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import ReactHtmlParser from "react-html-parser";


const isHTML = (x) => {
  return x !== null && (typeof x === "object") && x.hasOwnProperty("__html");
};

const unescapeHtml = (html) => {
  let el = document.createElement('div');
  return html.replace(/\&[#0-9a-z]+;/gi, function(enc){
    el.innerHTML = enc;
    return el.innerText;
  });
};

const HtmlComponent = ({html}) => {
  return (
    <>
      {ReactHtmlParser(unescapeHtml(decodeURI(html)))}
    </>
  );
};


Shiny.addCustomMessageHandler("shinyToastify", function(message){
  let toaster = toast;
  if(message.type !== "default"){
    toaster = toaster[message.type];
  }
  if(isHTML(message.text)){
    message.text = <HtmlComponent html={message.text.__html} />;
  }
  switch(message.config.transition) {
    case "slide":
      message.config.transition = Slide;
    break;
    case "zoom":
      message.config.transition = Zoom;
    break;
    case "flip":
      message.config.transition = Flip;
    break;
    case "bounce":
      message.config.transition = Bounce;
    break;
  }
  let jscallback = () => {};
  if(message.JScallback !== null){
    jscallback = eval(`() => {${decodeURI(message.JScallback)}}`);
  }
  let f = () => {};
  if(message.config.hasOwnProperty("toastId")){
    f = () => {Shiny.setInputValue(message.config.toastId + "_closed", true, {priority: "event"});}
  }
  message.config = $.extend(message.config, 
    {
      onClose: () => {
        jscallback();
        f();
        Shiny.setInputValue("shinyToastifyOnClose", true);
        setTimeout(function(){ Shiny.setInputValue("shinyToastifyOnClose", null) });
      }
    }
  );
  toaster(message.text, message.config);
});


Shiny.addCustomMessageHandler("shinyToastifyUpdate", function(message){
  if(isHTML(message.config.render)){
    message.config.render = <HtmlComponent html={message.config.render.__html} />;
  }
  switch(message.config.transition) {
    case "slide":
      message.config.transition = Slide;
    break;
    case "zoom":
      message.config.transition = Zoom;
    break;
    case "flip":
      message.config.transition = Flip;
    break;
    case "bounce":
      message.config.transition = Bounce;
    break;
  }
  let jscallback = () => {};
  if(message.JScallback !== null){
    jscallback = eval(`() => {${decodeURI(message.JScallback)}}`);
  }
  message.config = $.extend(message.config, 
    {
      onClose: () => {
        jscallback();
      }
    }
  );
  toast.update(message.toastId, message.config);
});


const Toaster = ({ configuration, value, setValue }) => {
  return <ToastContainer />;
};


reactShinyInput('.toastify', 'shinyToastify.toastify', Toaster);
