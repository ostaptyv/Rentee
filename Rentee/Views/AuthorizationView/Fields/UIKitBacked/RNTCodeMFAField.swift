//
//  RNTCodeMFAField.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 19.04.2022.
//

import UIKit

class RNTCodeMFAField: UIControl, UIKeyInput {
    public weak var delegate: RNTCodeMFAFieldDelegate?
    
    public private(set) var digitsCount = 4
    public private(set) var code = "" {
        didSet {
            if code.count == digitsCount {
                delegate?.codeFilled?()
            }
        }
    }
    
    private var contentView: UIView!
    private var digitLabels: [UILabel]!
    private var stackView: UIStackView!
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    var hasText: Bool {
        return code.isEmpty
    }
    var keyboardType: UIKeyboardType {
        get {
            return .numberPad
        }
        set {
            // swiftlint:disable:previous unused_setter_value
            //
            // Do nothing, since we don't want to allow user to choose their own keyboard,
            // but at the same time we need to conform to UITextInputTraits protocol (inherited
            // by UIKeyInput) to be able to choose the keyboard type.
        }
    }
    
    // MARK: - Public methods
    
    public func setCode(_ code: String) throws {
        guard code.count <= digitsCount else {
            throw "You can't set the code that is longer than number of digit fields"
        }
        
        let isAllCharactersNumbers = code.unicodeScalars.allSatisfy { unicodeScalar in
            return CharacterSet.decimalDigits.contains(unicodeScalar)
        }
        guard isAllCharactersNumbers else {
            throw "In MFA code you are able to use only numbers"
        }
        
        self.code = code
        updateDigitLabels()
        delegate?.codeUpdated?(code)
    }
    
    // MARK: - Entry point
    
    private func setupView() {
        setupInterface()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(codeMFAFieldTapped))
        self.addGestureRecognizer(tapRecognizer)
    }
    
    // MARK: - Setup interface
    
    private func setupInterface() {
        initializeInterface()
        setupViewHierarchy()
        constraintInterface()
    }
    
    // MARK: - Initialize elements of UI
    
    private func initializeInterface() {
        contentView = makeContentView()
        
        digitLabels = [UILabel]()
        for _ in 0..<digitsCount {
            digitLabels.append(makeDigitLabel())
        }
        
        stackView = makeStackView()
    }
    
    private func makeContentView() -> UIView {
        let contentView = UIView()
        contentView.isUserInteractionEnabled = false
        
        return contentView
    }
    private func makeDigitLabel() -> UILabel {
        let digitLabel = UILabel()
        digitLabel.backgroundColor = UIColor(.init(hex: "F9F9FB")!)
        digitLabel.textColor = UIColor(.init(hex: "1F1F3B")!)
        digitLabel.font = R.font.notoSansRegular(size: 16)
        digitLabel.layer.cornerRadius = 15
        digitLabel.isUserInteractionEnabled = false
        digitLabel.textAlignment = .center
        digitLabel.clipsToBounds = true
        
        return digitLabel
    }
    private func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.spacing = 14.5
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.isUserInteractionEnabled = false
        
        return stackView
    }
    
    // MARK: - Establish view hierarchy
    
    private func setupViewHierarchy() {
        self.addSubview(contentView)
        contentView.addSubview(stackView)
        
        for digitLabel in digitLabels {
            stackView.addArrangedSubview(digitLabel)
        }
    }
    
    // MARK: - Set up views' constraints
    
    private func constraintInterface() {
        self.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        constraintContentView(contentView)
        constraintStackView(stackView)
    }
    
    private func constraintContentView(_ contentView: UIView) {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    private func constraintStackView(_ stackView: UIView) {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
    }
    
    // MARK: - UIKeyInput implementation
    
    func insertText(_ text: String) {
        if code.count < digitsCount {
            code.append(text)
            
            updateDigitLabels()
            delegate?.codeUpdated?(code)
        }
    }
    func deleteBackward() {
        if !code.isEmpty {
            code.removeLast()
            
            updateDigitLabels()
            delegate?.codeUpdated?(code)
        }
    }
    
    // MARK: - Respond to user interaction
    
    @objc private func codeMFAFieldTapped() {
        self.becomeFirstResponder()
    }
    
    // MARK: - Private helping methods
    
    private func updateDigitLabels() {
        for (index, digitLabel) in digitLabels.enumerated() {
            if let index = codeIndex(for: index) {
                let character = code[index]
                digitLabel.text = String(character)
            } else {
                digitLabel.text = "" // case if code.count < digitsCount, so there're one or more empty fields
            }
        }
    }
    
    private func codeIndex(for index: Int) -> String.Index? {
        guard index < code.count else {
            return nil
        }
        
        let startIndex = code.startIndex
        return code.index(startIndex, offsetBy: index)
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    init(digitsCount: Int) throws {
        guard digitsCount > 0 else {
            throw "You can't specify the field to have number of digits less than 1"
        }
        
        super.init(frame: .zero)
        self.digitsCount = digitsCount
        
        setupView()
    }
}
