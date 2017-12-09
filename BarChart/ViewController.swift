
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrlView: UIScrollView!
    
    var data = [0]

    // MARK: - UIView Life Cycle Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0..<30{
            let randomNo = Int(arc4random_uniform(100))
            data.append(randomNo)
        }
        callDrawLine()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Draw Bar Graph -
    
    func callDrawLine(){
        var x: CGFloat = 25.0
        for val in data {
            let original = CGFloat(val)*2
            let start = CGPoint(x:x,y:self.view.frame.size.height - original)
            let end = CGPoint(x:x,y:self.view.frame.size.height + original)
            
            drawLine(startpoint: start, endpint: end,linecolor:       UIColor.red.cgColor,linewidth: 20.0)
            
            let label = UILabel(frame: CGRect(x: x - 18, y: self.view.frame.size.height - (original+30), width: 35, height: 21))
            label.textAlignment = .center
            label.text = String(val)
            self.scrlView.addSubview(label)
            
            x = x + 40.0
        }
        scrlView.contentSize = CGSize(width: x-10, height: self.view.frame.size.height)
    }
    
    func drawLine(startpoint start:CGPoint, endpint end:CGPoint, linecolor color: CGColor ,  linewidth widthline:CGFloat){
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = widthline
        
        scrlView.layer.addSublayer(shapeLayer)
    }
}

