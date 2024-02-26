(in-package #:recaptcha-enterprise)

(defparameter *api-key* nil
  "API key associated with the current project")
(defparameter *project-id* nil
  "your Google Cloud project ID")

(defun verify (key-id token &optional (action "LOGIN"))
  (assert (not (null *api-key*)))
  (assert (not (null *project-id*)))
  (let* ((response (dex:post (format nil "https://recaptchaenterprise.googleapis.com/v1/projects/~A/assessments?key=~A"
                                     *project-id* *api-key*)
                             :headers `(("Content-Type" . "application/json"))
                             :content (jojo:to-json (list :|event| (list :|token| token
                                                                         :|siteKey| key-id
                                                                         :|expectedAction| action))))))
    (jojo:parse response)))

(defun risk-analysis (response)
  (getf :|riskAnalysis| response))

(defun token-properties (response)
  (getf :|tokenProperties| response))

(defun event (response)
  (getf :|event| response))

(defun name (response)
  (getf :|name| response))

(defun validp (response)
  (getf :|valid| (token-properties response)))

(defun invalid-reason (response)
  (getf :|invalidReason| (token-properties response)))

(defun score (response)
  (getf :|score| (risk-analysis response)))
