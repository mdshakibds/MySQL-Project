/* ============================================================
   1. CURRENTLY ADMITTED PATIENTS
   ============================================================ */
SELECT PatientID, FirstName, LastName, Department, DoctorAssigned, AdmissionDate
FROM hospital_management_system
WHERE DischargeDate IS NULL;

/* ============================================================
   2. ADMITTED PATIENTS PER DEPARTMENT
   ============================================================ */
SELECT Department, COUNT(*) AS AdmittedPatients
FROM hospital_management_system
WHERE DischargeDate IS NULL
GROUP BY Department
ORDER BY AdmittedPatients DESC;

/* ============================================================
   3. TOTAL HOSPITAL REVENUE
   ============================================================ */
SELECT SUM(TotalBill) AS TotalRevenue
FROM hospital_management_system;

/* ============================================================
   4. PATIENTS WITH UNPAID OR PENDING BILLS
   ============================================================ */
SELECT PatientID, FirstName, LastName, TotalBill, PaymentStatus
FROM hospital_management_system
WHERE PaymentStatus IN ('Pending', 'Partially Paid', 'Insurance Pending');

/* ============================================================
   5. REVENUE BY DEPARTMENT
   ============================================================ */
SELECT Department, SUM(TotalBill) AS DepartmentRevenue
FROM hospital_management_system
GROUP BY Department
ORDER BY DepartmentRevenue DESC;

/* ============================================================
   6. DOCTOR WITH MOST PATIENTS
   ============================================================ */
SELECT DoctorAssigned, COUNT(*) AS TotalPatients
FROM hospital_management_system
GROUP BY DoctorAssigned
ORDER BY TotalPatients DESC
LIMIT 1;

/* ============================================================
   7. AVERAGE BILL PER DEPARTMENT
   ============================================================ */
SELECT Department, ROUND(AVG(TotalBill), 2) AS AvgBill
FROM hospital_management_system
GROUP BY Department
ORDER BY AvgBill DESC;

/* ============================================================
   8. OCCUPIED ROOMS (CURRENTLY ADMITTED)
   ============================================================ */
SELECT RoomNumber, BedNumber, FirstName, LastName
FROM hospital_management_system
WHERE DischargeDate IS NULL;

/* ============================================================
   9. ROOM UTILIZATION COUNT
   ============================================================ */
SELECT RoomNumber, COUNT(*) AS TotalPatients
FROM hospital_management_system
GROUP BY RoomNumber
ORDER BY TotalPatients DESC;

/* ============================================================
   10. INSURED PATIENTS LIST
   ============================================================ */
SELECT FirstName, LastName, InsuranceProvider, PolicyNumber
FROM hospital_management_system
WHERE InsuranceProvider <> 'No Insurance';

/* ============================================================
   11. PATIENTS BY INSURANCE PROVIDER
   ============================================================ */
SELECT InsuranceProvider, COUNT(*) AS CoveredPatients
FROM hospital_management_system
WHERE InsuranceProvider <> 'No Insurance'
GROUP BY InsuranceProvider
ORDER BY CoveredPatients DESC;

/* ============================================================
   12. TOTAL ADMISSIONS PER MONTH
   ============================================================ */
SELECT strftime('%Y-%m', AdmissionDate) AS Month, COUNT(*) AS TotalAdmissions
FROM hospital_management_system
GROUP BY Month
ORDER BY Month;

/* ============================================================
   13. AVERAGE STAY DURATION PER DEPARTMENT
   ============================================================ */
SELECT Department,
       ROUND(AVG(julianday(DischargeDate) - julianday(AdmissionDate)), 1) AS AvgStayDays
FROM hospital_management_system
WHERE DischargeDate IS NOT NULL
GROUP BY Department
ORDER BY AvgStayDays DESC;

/* ============================================================
   14. PATIENT COUNT BY GENDER
   ============================================================ */
SELECT Gender, COUNT(*) AS TotalPatients
FROM hospital_management_system
GROUP BY Gender;

/* ============================================================
   15. AVERAGE BILL BY GENDER
   ============================================================ */
SELECT Gender, ROUND(AVG(TotalBill), 2) AS AvgBill
FROM hospital_management_system
GROUP BY Gender;

/* ============================================================
   16. MOST COMMON DIAGNOSES
   ============================================================ */
SELECT Diagnosis, COUNT(*) AS Cases
FROM hospital_management_system
GROUP BY Diagnosis
ORDER BY Cases DESC
LIMIT 5;

/* ============================================================
   17. PATIENTS PER TREATMENT TYPE
   ============================================================ */
SELECT Treatment, COUNT(*) AS TotalPatients
FROM hospital_management_system
GROUP BY Treatment
ORDER BY TotalPatients DESC;

/* ============================================================
   18. TOP 3 DOCTORS GENERATING HIGHEST REVENUE
   ============================================================ */
SELECT DoctorAssigned, SUM(TotalBill) AS TotalRevenue
FROM hospital_management_system
GROUP BY DoctorAssigned
ORDER BY TotalRevenue DESC
LIMIT 3;

/* ============================================================
   19. DEPARTMENT WITH LONGEST AVERAGE STAY
   ============================================================ */
SELECT Department, 
       ROUND(AVG(julianday(DischargeDate) - julianday(AdmissionDate)), 1) AS AvgStayDays
FROM hospital_management_system
WHERE DischargeDate IS NOT NULL
GROUP BY Department
ORDER BY AvgStayDays DESC
LIMIT 1;

/* ============================================================
   20. DAILY ADMISSIONS REPORT
   ============================================================ */
SELECT AdmissionDate, COUNT(*) AS TotalAdmissions
FROM hospital_management_system
GROUP BY AdmissionDate
ORDER BY AdmissionDate DESC;

/* ============================================================
   21. TOTAL AMOUNT PENDING BY PAYMENT STATUS
   ============================================================ */
SELECT PaymentStatus, ROUND(SUM(TotalBill), 2) AS TotalAmount
FROM hospital_management_system
WHERE PaymentStatus IN ('Pending', 'Partially Paid', 'Insurance Pending')
GROUP BY PaymentStatus;

/* ============================================================
   22. MOST FREQUENT DIAGNOSIS PER DEPARTMENT
   ============================================================ */
SELECT Department, Diagnosis, COUNT(*) AS CaseCount
FROM hospital_management_system
GROUP BY Department, Diagnosis
HAVING COUNT(*) = (
  SELECT MAX(COUNT(*))
  FROM hospital_management_system AS h2
  WHERE h2.Department = hospital_management_system.Department
  GROUP BY h2.Diagnosis
);

/* ============================================================
   23. AVERAGE REVENUE PER PATIENT
   ============================================================ */
SELECT ROUND(SUM(TotalBill) / COUNT(*), 2) AS AvgRevenuePerPatient
FROM hospital_management_system;
