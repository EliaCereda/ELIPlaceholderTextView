//
//  ELIPlaceholderTextView.swift
//  ELIPlaceholderTextView
//
//  Created by Elia Cereda on 9/5/16.
//  Copyright © 2016 Elia Cereda All rights reserved.
//

import UIKit
import Cartography

public class ELIPlaceholderTextView: UITextView {

	public let placeholderLabel = UILabel()
	private var placeholderConstraints = ConstraintGroup()

	// MARK: Initialization

    public init() {
		super.init(frame: CGRectZero, textContainer: nil)

		setupView()
	}

	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

		setupView()
	}

	private func setupView() {
        self.placeholderLabel.numberOfLines = 0
        self.placeholderLabel.textColor = UIColor.grayColor()
        
		self.addSubview(placeholderLabel)

		NSNotificationCenter.defaultCenter()
			.addObserver(self, selector: #selector(textDidChange(_:)), name: UITextViewTextDidChangeNotification, object: self)
	}

	deinit {
		NSNotificationCenter.defaultCenter()
			.removeObserver(self)
	}

	// MARK: Properties

    @IBInspectable dynamic
	public var placeholder: String? {
		get { return placeholderLabel.text }
		set { placeholderLabel.text = newValue }
	}

	// MARK: Updates

	func textDidChange(sender: UITextView) {
		self.placeholderLabel.hidden = (self.text.isEmpty == false)
	}

	// MARK: Appearance

	dynamic // UIAppearance
	public override var textContainerInset: UIEdgeInsets {
		didSet {
			self.setNeedsUpdateConstraints()
		}
	}

	dynamic // UIAppearance
	public override var font: UIFont? {
		didSet {
			self.placeholderLabel.font = font
		}
	}

	dynamic // UIAppearance
	public override var tintColor: UIColor? {
		didSet {
			self.placeholderLabel.textColor = tintColor
		}
	}

	// MARK: Layout

	public override func updateConstraints() {
		super.updateConstraints()

		let insets = self.textContainerInset

		self.placeholderConstraints = constrain(placeholderLabel, self, replace: self.placeholderConstraints) { placeholderLabel, view in
            placeholderLabel.top == view.top + insets.top
            placeholderLabel.bottom <= view.bottom - insets.bottom
            
            placeholderLabel.leading == view.leading + (insets.left + 4)
            
            let horizontalInsets = (insets.left + 4) + (insets.right + 4)
            placeholderLabel.width <= view.width - horizontalInsets
		}
	}
}
