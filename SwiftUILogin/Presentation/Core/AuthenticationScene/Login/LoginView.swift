//
//  Created by Rohit on 02/01/24.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    
    @StateObject private var observed = Observed()
    
    // MARK: - Body
    
    var body: some View {
        
        VStack {
            VStack(spacing: 18) {
                VStack(spacing: 12) {
                    VStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Your Email")
                                .font(.custom(.semiBold, size: 16))
                                .foregroundColor(.init(hexString: "#2A2A2A"))
                            HStack {
                                TextField("Email", text: $observed.email)
                                    .padding()
                            }
                            .frame(height: 56)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(observed.isEmailValid ? Color(hexString: "#E1E1E1") : .red, lineWidth: 2)
                            )
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Password")
                                .font(.custom(.semiBold, size: 16))
                                .foregroundColor(.init(hexString: "#2A2A2A"))
                            HStack {
                                SecureField("Password", text: $observed.password)
                                    .padding()
                            }
                            .frame(height: 56)
                            .overlay(
                                ZStack {
                                    HStack {
                                        Spacer()
                                        Button(action: {
                                            
                                        }, label: {
                                            Image(uiImage: UIImage(resource: .eyeCrossed))
                                                .foregroundColor(.gray)
                                                .padding(.trailing, 10)
                                        })
                                    }
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(hexString: "#E1E1E1"), lineWidth: 2)
                                }
                            )
                        }
                    }
                    HStack {
                        Button(action: {
                        }, label: {
                            Text("Wrong Password")
                                .font(.custom(.semiBold, size: 16))
                                .foregroundColor(Color(hexString: "#D9D9D9"))
                        })
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Forgot Password?")
                                .font(.custom(.semiBold, size: 16))
                                .foregroundColor(Color(hexString: "#648DDB"))
                        })
                    }
                }
                Button(action: {
                    print("Button tapped")
                }, label: {
                    Text("Continue")
                        .font(.custom(.bold, size: 20))
                        .foregroundColor(.white)
                })
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 56)
                .background(observed.isReadyToSubmit ? Color(hexString: "#648DDB") : .gray)
                .cornerRadius(12)
                .disabled(!observed.isReadyToSubmit)
            }
            .padding(.horizontal, 25)
            .padding(.top, 72)
            .frame(maxWidth: .infinity)
            Spacer()
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView()
            .previewLayout(.sizeThatFits)
    }
    
}
