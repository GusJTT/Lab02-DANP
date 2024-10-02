//
//  LoginView.swift
//  Lab02
//
//  Created by Gustavo on 1/10/24.
//

import SwiftUI
struct LoginView: View {
    @Binding var isLoggedin:Bool
    @State private var username=""
    @State private var password=""
    @State private var showAlert=false
    var body: some View {
        NavigationView{
            VStack{
                Image("user-3296")
                    .resizable()
                    .frame(maxWidth:100, maxHeight: 100)
                    .scaledToFit()
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                Button("Login", action:btnLogin)
                    .buttonStyle(.borderedProminent)
                NavigationLink(destination: RegisterView()){
                    Text("Create my account")
                }
                .navigationTitle("Login")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
            }
            .alert(isPresented: $showAlert){
                Alert(title: Text("Fallo de incio de sesion"), message: Text("Ingrese un nombre de usuario o contraseña validos"))
            }
        }
    }
    func btnLogin(){
        let savedUser = UserDefaults.standard.string(forKey: "user")
        let savedPassword = UserDefaults.standard.string(forKey: "password")
        if savedUser == username && savedPassword == password{
            isLoggedin = true
            showAlert = false
            
        } else {
            isLoggedin = false
            showAlert = true
        }
    }
}
