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
 
 # 0. debug và test các class này, từ dễ đến khó (1->3).
    0. Xem cách tạo và debug project dart ở https://www.youtube.com/watch?v=H-QKneVNOhE&t=536s
    1. Xem về cách test ở https://www.youtube.com/watch?v=cVru6Gy4duQ&list=PLptHs0ZDJKt_T-oNj_6Q98v-tBnVf-S_o&index=6 
    2. Các class đều kế thừa từ class Equatable.
    3. print class thì viết hàm đè {toString()} https://coflutter.com/dart-how-to-print-an-object/
    4. runtimetype thì sẽ là tên class.
   
