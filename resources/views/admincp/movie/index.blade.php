@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <a href="{{ route('movie.create') }}" class="btn btn-primary">Thêm phim</a>
                <table class="table" id="tablephim">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Title</th>
                            {{-- <th scope="col">Slug</th> --}}
                            <th scope="col">Image</th>
                            <th scope="col">Tags</th>
                            <th scope="col">Thời Lượng Phim</th>
                            {{-- <th scope="col">Description</th> --}}
                            <th scope="col">Phim Hot</th>
                            <th scope="col">Định Dạng</th>
                            <th scope="col">Phụ Đề</th>
                            <th scope="col">Active/Hide</th>
                            <th scope="col">Category</th>
                            <th scope="col">Genre</th>
                            <th scope="col">Country</th>
                            <th scope="col">Ngày tạo</th>
                            <th scope="col">Ngày cập nhật</th>
                            <th scope="col">Năm</th>
                            <th scope="col">Top Views</th>
                            <th scope="col">Manage</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($list as $key => $cate)
                            <tr>
                                <th scope="row">{{ $key }}</th>
                                <td>{{ $cate->title }}</td>
                                {{-- <td>{{ $cate->slug }}</td> --}}
                                <td><img width="50px" src="{{ asset('uploads/movie/' . $cate->image) }}"></td>
                                <td>{{ $cate->tags }}</td>
                                <td>{{ $cate->thoiluong }}</td>
                                {{-- <td>{{ $cate->description }}</td> --}}
                                <td>
                                    @if ($cate->phim_hot == 0)
                                        Không
                                    @else
                                        Có
                                    @endif
                                </td>
                                <td>
                                    @if ($cate->resolution == 0)
                                        HD
                                    @elseif ($cate->resolution == 1)
                                        SD
                                    @elseif ($cate->resolution == 2)
                                        HDCam
                                    @elseif ($cate->resolution == 3)
                                        Cam
                                    @else
                                        FullHD
                                    @endif
                                </td>
                                <td>
                                    @if ($cate->phude == 0)
                                        Phụ đề
                                    @else
                                        Thuyết minh
                                    @endif
                                </td>
                                <td>
                                    @if ($cate->status)
                                        Hiển thị
                                    @else
                                        Ẩn
                                    @endif
                                </td>
                                <td>{{ $cate->category->title }}</td>
                                <td>{{ $cate->genre->title }}</td>
                                <td>{{ $cate->country->title }}</td>
                                <td>{{ $cate->ngaytao }}</td>
                                <td>{{ $cate->ngaycapnhat }}</td>
                                <td>
                                    {!! Form::selectYear('year', 2000, 2023, isset($cate->year) ? $cate->year : '', [
                                        'class' => 'select-year',
                                        'id' => $cate->id,
                                    ]) !!}
                                </td>
                                <td>
                                    {!! Form::select('topview', ['0' => 'Ngày', '1' => 'Tuần', '2' => 'Tháng'], isset($cate->topview) ? $cate->topview : '', [
                                        'class' => 'select-topview',
                                        'id' => $cate->id,
                                    ]) !!}
                                </td>
                                <td>
                                    {!! Form::open([
                                        'method' => 'DELETE',
                                        'route' => ['movie.destroy', $cate->id],
                                        'onsubmit' => 'return confirm("Bạn có chắc chắn muốn xoá")',
                                    ]) !!}
                                    {!! Form::submit('Xoá', ['class' => 'btn btn-danger']) !!}
                                    {!! Form::close() !!}
                                    <a href="{{ route('movie.edit', $cate->id) }}" class="btn btn-warning">Sửa</a>
                                </td>
                            </tr>
                        @endforeach

                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
