module.exports = App.SliderView = Ember.View.extend
  templateName: 'slider'
  classNames: ['col-xs-12', 'slider']
  init: ()->
    @._super
    obj = this.get('content.firstObject');
    Ember.set(obj, 'isActive', true);

  actions:
    nextSlide: ()->
      $('.carousel').carousel('next')
      console.log('next')
    prevSlide: ()->
      $('.carousel').carousel('prev')
      console.log('prev')
  didInsertElement: () ->
        $('.carousel').carousel()
      
  slidesView: Ember.CollectionView.extend
    classNames: ['carousel-inner']
    contentBinding: 'parentView.content'
    itemViewClass: Ember.View.extend
      classNames: ['item']
      classNameBindings: ['content.isActive:active'],
      template: Ember.Handlebars.compile('\
                <img {{bind-attr src="view.content.img"}} class="img-responsive" alt=""/>\
                <div class="carousel-caption">\
                    <h4>{{view.content.title}}</h4>\
                    <p>{{view.content.text}}</p>\
                </div>')