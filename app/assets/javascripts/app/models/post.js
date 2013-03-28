app.models.Post = Backbone.Model.extend({

  date: function() {
    return moment(this.get("created_at")).format("MMM D, YYYY");
  }

});
