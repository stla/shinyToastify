# shinyToastify 2.0.0

* Added dependency to the `fontawesome` package, to allow inclusion of an icon 
in a toast. Icons must be included with the `fa_i` function; that does not 
work with the `fa` function.

* Allow to pass a `shiny.tag` object to the `text` argument of the `showToast` 
function. This allows for example to use 
`text = tags$span(style = "color:lime;", "Message")` instead of 
`HTML('<span style="color:lime;">Message</span>')`.

* The `showToast` function has a new argument `id`. See the details in 
`?showToast` for its usage. It can be used for an alternative of the R callback.

* New function `toastUpdate`, to update a toast.


# shinyToastify 1.0.0

First release.
