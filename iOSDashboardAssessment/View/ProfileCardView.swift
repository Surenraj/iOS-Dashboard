//
//  ProfileCardView.swift
//  iOSDashboardAssessment
//
//  Created by Suren Raj on 28/05/24.
//

import SwiftUI
import SampleData

struct ProfileCardView: View {
    
    var profileData: ProfileDataModel?
    var dateFormat = "EEEE, MMMM d'th' yyyy"
    
    var body: some View {
        CardView {
            HStack {
                if let profileData = profileData {
                    VStack(alignment: .leading) {
                        Text("\(profileData.name)! 👋")
                            .font(.headline)
                        Text(Utils.shared.getCurrentDate(format: dateFormat))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    }
                    Spacer()
                        Image(profileData.image)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                }
            }
        }
    }
}

#Preview {
    ProfileCardView()
}
