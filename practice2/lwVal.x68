Start     LEA       $4000, A0       * loading address to A0
          MOVE.L    #$AAAAFFFF,D7   * move Long
          MOVE.L    #$55550000,D6   * move Long data to D6
          MOVE.W    D7, D0          * move word at D7 (AAAA) to D0
          * D0: AAAA
          SWAP      D6              * before it was 55550000 now: 00005555
          SWAP      D0              * D0: AAAA 0000
          MOVE.W    D6, D0          * Load Word data in D6, 
          MOVE.L    D0, (A0)        *Save it 