//
//  NetworkManager.swift
//  Pokodex_UIKit
//
//  Created by MehrDad on 03.12.2022.
//

import Foundation
import UIKit

@MainActor
final class PokemonManager: ObservableObject {
    
    private let networkService = NetworkService()
    
    @Published private(set) var pokemonList: [Pokemon] = []
    @Published private(set) var pokemonFiltered: [Pokemon] = []
    private var pokemonIndex: PokemonIndex?
    
    private func getPokemons() async throws -> [Pokemon] {
        return try await withThrowingTaskGroup(of: Pokemon.self) { group in
            
            var results: [Pokemon] = []
            
            guard let pokemonIndex = pokemonIndex else {
                throw Error.missingPokemonIndex
            }
            
            for url in pokemonIndex.results.map({ $0.url }) {
                group.addTask() {
                    return try await self.getData(by: url)
                }
            }
            
            for try await pokemon in group {
                results.append(pokemon)
            }
            return results
        }
    }
    
    func loadPokemons(firstCall: Bool = false) async {
        
        do {
            pokemonIndex = try await getData(
                by: firstCall ? URL(string: "https://pokeapi.co/api/v2/pokemon/")! : self.pokemonIndex?.next
            )
            pokemonList.append(
                contentsOf: try await getPokemons()
            )
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func filterPokemons(by text: String) {
        pokemonFiltered = pokemonList.filter({ $0.name.localizedCaseInsensitiveContains(text) })
    }
}

extension PokemonManager {
    
    private func getData<T:Codable>(by url: URL?) async throws -> T {
        guard let url = url else {
            throw Error.invalidURL
        }
        return try await networkService.fetchObject(for: url)
    }
}

extension PokemonManager {
    
    enum Error: LocalizedError {
        case invalidURL
        case missingPokemonIndex
    }
}
