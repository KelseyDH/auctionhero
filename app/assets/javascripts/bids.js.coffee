# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/
# $ ->
#   $(document).on "submit", "#new_bids", ->
#     $("#bid-errors").html("")
#     $.ajax
#       method: "post"
#       url: $(@).attr("action")
#       data:
#         bid:
#           amount: $("#bid_amount").val()
#       error: ->
#         alert("bid didn't create. Please reload page.")
#       success: (data) ->
#         if data.status == "success"
#           $("#bid_amount").val("")
#           template = $("#bid-template").html()
#           rendered = Mustache.render(template, {title: data.title, url: data.url})
#           $("#pending-bids").append(rendered)
#         else
#           $("#bid-errors").hide()
#           $("#bid-errors").html(data.errors)
#           $("#bid-errors").fadeIn(1500)

#     false

#   # $(".draggable").draggable
#   #   appendTo: ".droppable"

#   # $(".droppable").droppable
#   #   hoverClass: "alert-info"
#   #   drop: (event, ui) ->
#   #     $(ui.draggable).css("left", 0)
#   #     $(ui.draggable).css("top", 0)
#   #     $(@).prepend($(ui.draggable))
#   #     if $(@).attr("id") == "completed-bids" 
#   #       completed = true
#   #     else
#   #       completed = false
#   #     update_task_status $(ui.draggable).data("url"),
#   #                        completed

# update_bid_status= (url, status) ->
#   $.ajax
#     method: "patch"
#     url: url
#     data:
#       bid:
#         completed: status
#     error: ->
#       alert("something went wrong please refresh page")
#     success: (data) ->
#       unless data.status == "success"
#         alert("Something went wrong please refresh")





