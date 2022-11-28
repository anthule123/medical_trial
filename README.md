# Xây dựng model cho việc điều trị tiểu đường (theo kiểu bottom up)

```dart
const like = 'sample';
```
## 1. class MedicalAction:
    - ý nghĩa: là hoạt động y tế, có thể là kiểm tra đường máu, hoặc tiêm,...
    - có attribute là time.
    - time có cấu trúc dữ liệu là DataTime ở Dart và String ở database.
    Có 2 class kế thừa từ class này là class kiểm tra đường máu, và class tiêm insulin
   ### 1.1. class MedicalCheckGlucose
       - Có thêm attribute là glucoseUI : lượng glucose đo được.
   ### 1.2. class MedicalTakeInsulin
       - Có thêm attribute là loại Insulin tiêm vào: 1 trong 3 loại: Actrapid, Glagrine, NPH, có thể 
         để type là String ở database và để là enum ở dart.
       - Có attribute là lượng Insulin tiêm vào.
## 2. class Regimen
    - ý nghĩa: là một phác đồ điều trị, bao gồm một danh sách các hoạt động y tế
    - có attribute là name và danh sách các MedicalAction, MedicalCheckInsulin, MedicalTakeInsulin.
    - Có function là: 
        + Thêm hoạt động y tế vào
## 3. class Patient
    - ý nghĩa: là bệnh nhân và các thông tin liên quan
    - attribute là name, id, weight, và danh sách regimens.
    - và vài attribute là các thông tin cá nhân khác.
   
