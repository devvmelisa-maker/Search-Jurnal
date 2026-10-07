 # jurnal.zsh
  # Custom command to search academic journals across multiple platforms at once.
  # Usage: jurnal <keywords>
  # Example: jurnal machine learning sentiment analysis
  
  jurnal() {
    if [ -z "$@" ]; then
      echo "❌ Masukkan kata kunci pencarian."
      echo "📖 Cara pakai: jurnal <kata kunci>"
      echo "📖 Contoh: jurnal machine learning sentiment analysis"
      return 1
    fi
  
    local query="${(j:+:)@}"
    local doaj_query=$(echo "$@" | sed 's/ /%20/g')
  
    echo "🔍 Mencari dokumen tentang '$@' di seluruh portal jurnal..."
  
    open 'https://acm.org'"$query"
    open 'https://kemdiktisaintek.go.id'"$query"
    open 'https://neliti.com'"$query"
    open 'https://sciencedirect.com'"$query"
    open 'https://springer.com'"$query"'&facet-content-type=Journal'
    open 'https://onesearch.id'"$query"
    open 'https://perpusnas.go.id'
    open 'https://scopus.com'"$query"'%29'
    open 'https://doaj.org'"$doaj_query"'%22%7D%7D%7D'
    open 'https://dimensions.ai'"$query"
    open 'https://ieee.org'"$query"
  
    echo "✅ Selesai! ${#@} kata kunci dikirim ke semua portal."
  }
