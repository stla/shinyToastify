import { reactShinyInput } from "reactR";
import { ToastContainer, toast } from "react-toastify";
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
  toaster(message.text, message.config);
});


const Toaster = ({ configuration, value, setValue }) => {
  return <ToastContainer />;
};


reactShinyInput('.toastify', 'shinyToastify.toastify', Toaster);
