//
//  RegisterView.swift
//  Lab02
//
//  Created by Gustavo on 1/10/24.
//

import SwiftUI
struct RegisterView: View {
    @State private var name=""
    @State private var surname=""
    @State private var email=""
    @State private var user=""
    @State private var password=""
    @State private var showAlert=false
    var body: some View {
        VStack{
            Group {
                Text("Registro de nuevo usuario")
                Text("Nombres")
                TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)
                Text("Apellidos")
                TextField("Surmane", text: $surname)
                    .textFieldStyle(.roundedBorder)
                Text("Email")
                TextField("email", text: $email)
                    .textFieldStyle(.roundedBorder)
            }
            Group {
                Text("Usuario:")
                TextField("Username", text: $user)                .textFieldStyle(.roundedBorder)
                Text("Constraseña")
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                Button("Register", action: {
                    UserDefaults.standard.set(name, forKey: "name")
                    UserDefaults.standard.set(surname, forKey: "surname")
                    UserDefaults.standard.set(email, forKey: "email")
                    UserDefaults.standard.set(user, forKey: "user")
                    UserDefaults.standard.set(password, forKey: "password")
                    showAlert = true
                })
                .buttonStyle(.borderedProminent)
                
            }
        }
        .alert(isPresented: $showAlert){
            Alert(title: Text("Registro"), message: Text("Usuario registrado exitosamente"))
        }
    }
}
