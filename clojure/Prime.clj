(ns Prime (:gen-class))

(defn sieve [size]
    (if (<= size 1)
        (boolean-array size false)
        (let [sieveArray (boolean-array size true)
              root (+ 1 (int (Math/sqrt size)))]
            (aset-boolean sieveArray 0 false)
            (aset-boolean sieveArray 1 false)
            (doseq [i (range 2 root)]
                (when (aget sieveArray i)
                    (doseq [j (range (* i i) size i)]
                        (aset-boolean sieveArray j false))))
            sieveArray)))

(defn countPrime [n]
    (count (filter identity (sieve (+ n 1)))))

(defn -main [& args]
    (let [n (if (not-empty args) (Integer/parseInt (first args)) 10000000)]
        (println (countPrime n))))