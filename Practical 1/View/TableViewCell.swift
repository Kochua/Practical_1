//
//  TableViewCell.swift
//  Practical 1
//
//  Created by Tako Metonidze on 12.06.24.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {
  private lazy var avatarImage: UIImageView = {
    let view = UIImageView(frame: .zero)
    return view
  }()

  private lazy var titleLabel: UILabel = {
    let view = UILabel(frame: .zero)
    view.textColor = .purple
    return view
  }()

  private lazy var ageLabel: UILabel = {
    let view = UILabel(frame: .zero)
    view.textColor = .purple
    return view
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    setup()
    setupConstraint()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    addSubview(avatarImage)
    addSubview(titleLabel)
    addSubview(ageLabel)
  }

  private func setupConstraint() {
    avatarImage.snp.remakeConstraints { make in
        make.size.equalTo(50)
//      make.centerX.equalToSuperview()
//      make.leading.equalToSuperview().offset(30)
    }

    titleLabel.snp.remakeConstraints { make in
      make.leading.equalTo(avatarImage.snp.trailing).offset(10)
      make.top.equalTo(avatarImage.snp.top)
    }

    ageLabel.snp.remakeConstraints { make in
      make.leading.equalTo(avatarImage.snp.trailing).offset(10)
      make.top.equalTo(avatarImage.snp.bottom)
    }
  }
    
    func configure(with data: UserProfile) {
        titleLabel.text = data.name
        
        guard let url = URL(string: data.profilePictureURL) else {
            return
        }
        avatarImage.kf.setImage(with: url)
      
    }

}
