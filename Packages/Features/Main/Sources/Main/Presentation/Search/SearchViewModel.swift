//
//  SearchViewModel.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import Combine

public final class SearchViewModel: ObservableObject {
    
    public init() {}
    
    @Published var selectedSide: SearchPickerSide = .Teams
    
    // TODO: when user taps team or player to send its id and fetch data with it
}
