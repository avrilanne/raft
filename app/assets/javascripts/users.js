var app window.app = {};

app.Users = function(){
  this._input = $('.friend-search');
  this._initAutocomplete();
};

app.Users.prototype {

};

_initAutocomplete: function(){
  this._input
  .autocomplete({
    source: '/users'
    appendTo: '.friend-search'
    select: $.proxy(this._select, this)
  })
  .autocomplete('instance')._renderItem = $.prox(this._render, this);
}
