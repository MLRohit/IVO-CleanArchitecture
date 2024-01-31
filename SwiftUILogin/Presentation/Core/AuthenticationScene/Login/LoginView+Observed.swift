//
//  Created by Rohit on 02/01/24.
//

import SwiftUI
import Combine

extension LoginView {
    
    class Observed: ObservableObject {
        
        // MARK: - Properties
        
        @Published var email = ""
        @Published var password = ""
        @Published var isReadyToSubmit = false
        @Published var isEmailValid = true
        
        private var cancellables = Set<AnyCancellable>()

        private var isEmailEmptyPublisher: AnyPublisher<Bool, Never> {
            $email
                .map {
                    !$0.isEmpty
                }
                .eraseToAnyPublisher()
        }
        private var isPasswordEmptyPublisher: AnyPublisher<Bool, Never> {
            $password
                .map {
                    !$0.isEmpty
                }
                .eraseToAnyPublisher()
        }
        
        private var isEmailValidPublisher: AnyPublisher<Bool, Never> {
            $email
                .map {
                    $0.isValidEmail
                }
                .eraseToAnyPublisher()
        }

        private var isFormValidPublisher: AnyPublisher<Bool, Never> {
            Publishers.CombineLatest3(isEmailEmptyPublisher,
                                     isPasswordEmptyPublisher,
                                      isEmailValidPublisher)
            .map { isEmailNotEmpty, isPasswordNotEmpty, isEmailValid in
                return isEmailNotEmpty && isPasswordNotEmpty && isEmailValid
            }
            .eraseToAnyPublisher()
        }
        
        // MARK: - Initializer
        
        init() {
            isFormValidPublisher
                .receive(on: RunLoop.main)
                .assign(to: \.isReadyToSubmit, on: self)
                .store(in: &cancellables)
            
            isEmailValidPublisher
                .receive(on: RunLoop.main)
                .assign(to: \.isEmailValid, on: self)
                .store(in: &cancellables)
        }
        
    }

}
