module MyModule::MusicStreaming {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    struct Music has store, key {
        artist: address,    // Address of the artist
        title: vector<u8>,  // Title of the music track
        price: u64,         // Price for streaming the track
    }

    /// Function for artists to upload their music with a price for streaming.
    public fun upload_music(artist: &signer, title: vector<u8>, price: u64) {
        let music = Music {
            artist: signer::address_of(artist),
            title,
            price,
        };
        move_to(artist, music);
    }
}
