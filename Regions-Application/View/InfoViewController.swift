import UIKit
class InfoViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    
    //data for the slides
    var titles = ["Россия",
                  "Украина",
                  "Белоруссия",
                  "Poland",
                  "Czech",
                  "Moldova",
                  "Lithuania",
                  "Turkey",
                  "Estonia",
                  "Germany",
                  "Slovakia",
                  "Bulgaria",
                  "Austria",
                  "Greece",
                  "Ireland",
                  "Romania"]
    var descs = ["Необходимо ввести код регистрации региона автомобильного номера частного пользования.Пример на картинке.",
                 "Необходимо ввести код регистрации региона автомобильного номера частного пользования.Пример на картинке.",
                 "Необходимо ввести код регистрации региона автомобильного номера частного пользования.Пример на картинке.",
                 "Example on the image.",
                 "Example on the image.",
                 "Необходимо ввести буквенный код региона автомобильного номера частного пользования до 2015 года.",
                 "Необходимо ввести первую букву автомобильного номера частного пользования.",
                 "Необходимо ввести первые 2 цифры автомобильного номера частного пользования.",
                 "Необходимо ввести первую букву автомобильного номера частного пользования.",
                 "Example on the image.",
                 "Example on the image.",
                 "Необходимо ввести одну или две первые буквы автомобильного номера частного пользования.",
                 "Необходимо ввести одну или две первые буквы автомобильного номера частного пользования.",
                 "Необходимо ввести две или три первые буквы автомобильного номера частного пользования.",
                 "Необходимо ввести одну или две буквы автомобильного номера частного пользования.",
                 "Необходимо ввести одну или две первые буквы автомобильного номера частного пользования."]
    var imgs = ["russia_number",
                "shema-nomera-ukraina",
                "avto-nomer-belarus",
                "poland-number-plates-infographics-english",
                "license-plate-infographics-en-1",
                "Moldova_license_plate_CAA001_November_2011",
                "1200px-Lithuanian_license_plate.svg",
                "Turkey_licenceplate",
                "Estonian_license_plate",
                "code-legend",
                "Slovak_ecv_expl",
                "Bulgarian_license_plate",
                "Austrian_license_plate",
                "1200px-Greek_license",
                "Official_Ireland",
                "Romanian_license_plate"]
    
    
    override func viewDidLayoutSubviews() {
        scrollWidth = scrollView.frame.size.width
        scrollHeight = scrollView.frame.size.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        
        let backBTN = UIBarButtonItem(image: UIImage(named: "Image"),
                                      style: .plain,
                                      target: navigationController,
                                      action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backBTN
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        self.scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        //crete the slides and add them
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        for index in 0..<titles.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)
            
            let slide = UIView(frame: frame)
            
            //subviews
            let imageView = UIImageView.init(image: UIImage.init(named: imgs[index]))
            imageView.frame = CGRect(x:0,y:0,width:300,height:300)
            imageView.contentMode = .scaleAspectFit
            imageView.center = CGPoint(x:scrollWidth/2,y: scrollHeight/2 - 50)
            
            let txt1 = UILabel.init(frame: CGRect(x:32,y:imageView.frame.maxY+10,width:scrollWidth-64,height:30))
            txt1.textAlignment = .center
            txt1.font = UIFont.boldSystemFont(ofSize: 20.0)
            txt1.text = titles[index]
            
            let txt2 = UILabel.init(frame: CGRect(x:32,y:txt1.frame.maxY,width:scrollWidth-64,height:50))
            txt2.textAlignment = .center
            txt2.numberOfLines = 0
            txt2.font = UIFont.systemFont(ofSize: 12.0)
            txt2.text = descs[index]
            
            slide.addSubview(imageView)
            slide.addSubview(txt1)
            slide.addSubview(txt2)
            scrollView.addSubview(slide)
            
        }
        scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count), height: scrollHeight)
        
        //disable vertical scroll/bounce
        self.scrollView.contentSize.height = 1.0
        
        //initial state
        pageControl.numberOfPages = titles.count
        pageControl.currentPage = 0
    }
    
    @IBAction func pageChanged(_ sender: Any) {
        scrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndiactorForCurrentPage()
    }
    
    func setIndiactorForCurrentPage()  {
        let page = (scrollView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
    }
}
