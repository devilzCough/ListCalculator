//
//  SettingView.swift
//  ListCalculator
//
//  Created by jiniz.ll on 2022/09/22.
//

import SwiftUI

struct SettingView: View {
    
    struct Setting: Hashable, Identifiable {
        let id = UUID()
        let content: String
    }
    
    struct SettingType: Identifiable {
        let id = UUID()
        let title: String
        let settings: [Setting]
    }
    
    private let settings = [
        
        SettingType(title: "일반", settings: [
            Setting(content: "언어"),
            Setting(content: "단위")
        ]),
        SettingType(title: "백업", settings: [
            Setting(content: "동기화")
        ]),
        SettingType(title: "지원", settings: [
            Setting(content: "리스트 계산기 사용법"),
            Setting(content: "의견 보내기")
        ]),
        SettingType(title: "기타", settings: [
            Setting(content: "About")
        ])
    ]
    

    var body: some View {
        NavigationView {
            List(settings) { section in
                Section(section.title) {
                    ForEach(section.settings) { setting in
                        Text(setting.content)
                    }
                }
            }
            .navigationTitle("설정")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
