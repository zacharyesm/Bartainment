import UIKit

class CardView: UIView {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .green
        return iv
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textColor = .white
        return lbl
    }()
    
    let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textColor = .white
        return lbl
    }()
    
    let jobLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textColor = .white
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        clipsToBounds = true
        layer.cornerRadius = 10
        
        let margins = layoutMarginsGuide
        
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        
        addSubview(jobLabel)
        jobLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -5).isActive = true
        jobLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
        jobLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        addSubview(priceLabel)
        priceLabel.bottomAnchor.constraint(equalTo: jobLabel.topAnchor, constant: -5).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        addSubview(nameLabel)
        nameLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -5).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func configureView(user: Int) {
        switch user {
        case 0:
            imageView.image = #imageLiteral(resourceName: "drake")
            nameLabel.text = "Drake"
            priceLabel.text = "$500"
            jobLabel.text = "Singer"
        case 1:
            imageView.image = #imageLiteral(resourceName: "dave-chappelle")
            nameLabel.text = "Dave"
            priceLabel.text = "$300"
            jobLabel.text = "Comedian"
        case 2:
            imageView.image = #imageLiteral(resourceName: "skrillex")
            nameLabel.text = "Skrillex"
            priceLabel.text = "$400"
            jobLabel.text = "DJ"
            
        default:
            imageView.image = #imageLiteral(resourceName: "dave-chappelle")
            nameLabel.text = "Dave"
            priceLabel.text = "$100"
            jobLabel.text = "Comedian"
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
