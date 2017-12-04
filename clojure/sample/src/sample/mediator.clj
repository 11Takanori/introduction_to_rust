(def mediator
  (atom {:users []
         :send (fn [user text])
           (map #(receive % text) users)}))

(defn add-user [u]
  (swap! mediator
    (fn [m]
      (update-in m [:users] conj u))))

(defn send-message [u text]
  (let [send-fn (:send @mediator)
        users (:users @mediator)]
    (send-fn users (format "%s: %s\n" (:name u) text))))

(add-user {:name "Mister White"})
(add-user {:name "Mister Pink"})
(send-message {:name "Joe"} "Toby?")
