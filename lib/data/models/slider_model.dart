class SliderModel{
  final String _image;
  final String _title;

  SliderModel(this._image, this._title,);

  String get title => _title;

  String get image => _image;


  static List<SliderModel> getSlides() {
    List<SliderModel> slides = [];
    SliderModel sliderModel = SliderModel("images/onboarding1.jpg","Добро пожаловать в 7FOOD");
    SliderModel sliderModel2 = SliderModel("images/onboarding2.jpg","Отсканируйте QR-код,чтобы выбрать еду");
    SliderModel sliderModel3 = SliderModel("images/onboarding1.jpg","Закройте холадильник легко и удобно");
    slides.add(sliderModel);
    slides.add(sliderModel2);
    slides.add(sliderModel3);
    return slides;
  }
}