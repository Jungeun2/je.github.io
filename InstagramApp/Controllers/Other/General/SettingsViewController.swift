//
//  SettingsViewController.swift
//  InstagramApp
//
//  Created by 이정은 on 2020/11/20.
//  Copyright © 2020 Jungeun Lee. All rights reserved.
//

import SafariServices
import UIKit

struct SettingCellModel {
    let title: String
    let handler: (() -> Void)
}

final class SettingsViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var data = [[SettingCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureModels() {
        data.append([
            SettingCellModel(title: "프로필 수정") { [weak self] in
                self?.didTapEditProfile()
            },
            SettingCellModel(title: "친구 초대") { [weak self] in
                self?.didTapInviteFriends()
            },
            SettingCellModel(title: "원본 게시물 저장") { [weak self] in
                self?.didTapSaveOriginalPosts()
            }
        ])
            
        data.append([
            SettingCellModel(title: "서비스 약관") { [weak self] in
                self?.openURL(type: .terms)
            },
            SettingCellModel(title: "개인정보보호 및 안전 센터") { [weak self] in
                self?.openURL(type: .privacy)
            },
            SettingCellModel(title: "고객센터") { [weak self] in
                self?.openURL(type: .help)
            }
        ])
    
            data.append([
                SettingCellModel(title: "로그아웃") { [weak self] in
                    self?.didTapLogOut()
            }
        ])
    }
    
    enum SettingsURLType {
        case terms, privacy, help
        
    }
    
    private func openURL(type: SettingsURLType) {
        let urlString: String
        switch type {
        case .terms: urlString = "https://www.facebook.com/help/instagram/termsofuse"
        case .privacy: urlString = "https://help.instagram.com/519522125107875"
        case .help: urlString = "https://help.instagram.com/"
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    private func didTapSaveOriginalPosts() {
        
    }
    
    private func didTapInviteFriends() {
        
    }
    
    public func didTapEditProfile() {
        let vc = EditProfileViewController()
        vc.title = "Edit Profile"
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    private func didTapLogOut() {
        let actionSheet = UIAlertController(title: "Log Out", message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
            AuthManager.shared.logOut(complection: { success in
                DispatchQueue.main.async {
                    if success {
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    } else {
                        fatalError("Could not log out user")
                    }
                }
            })
        }))
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        present(actionSheet, animated: true)
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for : indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.section][indexPath.row].handler()
    }
}
