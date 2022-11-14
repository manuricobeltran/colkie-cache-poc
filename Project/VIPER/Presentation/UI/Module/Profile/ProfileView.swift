//
//  ProfileView.swift
//  Project
//
//  Created by Jordi Gámez on 31/10/22.
//

import SwiftUI

struct ProfileView<Presenter: ProfilePresenter>: View {
    
    @EnvironmentObject var presenter: Presenter
    
    var body: some View {
        VStack {
            Text(presenter.profile.id)
            
            NameView1<Presenter>()
            
            NameView2(profile: presenter.profile)
            
            NameView3(name: $presenter.name)
        }
        .onAppear {
            presenter.loadProfile()
        }
    }
}

struct NameView1<Presenter: ProfilePresenter>: View {
    
    @EnvironmentObject var presenter: Presenter
    
    var body: some View {
        HStack {
            Text(presenter.profile.name)
            Text(presenter.name)
        }
    }
}

struct NameView2: View {
    
    let profile: Profile
    
    var body: some View {
        Text(profile.name)
    }
}

struct NameView3: View {
    
    @Binding var name: String
    
    var body: some View {
        Text(name)
            .onTapGesture {
                name = "Manuel Rico"
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
        
    static var previews: some View {
        ProfileView<MockProfilePresenter>()
            .environmentObject(MockProfilePresenter())
    }
}
