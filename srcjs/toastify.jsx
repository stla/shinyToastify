import { reactShinyInput } from "reactR";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

Shiny.addCustomMessageHandler("shinyToastify", function(x){
  toast('Wow so easy!', {
    position: "top-right",
    autoClose: 5000,
    hideProgressBar: false,
    closeOnClick: true,
    pauseOnHover: true,
    draggable: true,
    progress: undefined,
  });
  console.log("Toast", toast);
});

const Toaster = ({ configuration, value, setValue }) => {
  return <ToastContainer />;
};

reactShinyInput('.toastify', 'shinyToastify.toastify', Toaster);
