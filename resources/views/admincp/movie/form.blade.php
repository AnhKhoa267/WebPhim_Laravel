@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <a href="{{ route('movie.index') }}" class="btn btn-primary">Liệt kê phim</a>
                    <div class="card-header">{{ __('Quản lý phim') }}</div>

                    <div class="card-body">
                        @if (session('status'))
                            <div class="alert alert-success" role="alert">
                                {{ session('status') }}
                            </div>
                        @endif
                        @if (!isset($movie))
                            {!! Form::open(['route' => 'movie.store', 'method' => 'POST', 'enctype' => 'multipart/form-data']) !!}
                        @else
                            {!! Form::open(['route' => ['movie.update', $movie->id], 'method' => 'PUT', 'enctype' => 'multipart/form-data']) !!}
                        @endif
                        <div class="form-group">
                            {!! Form::label('title', 'Title', []) !!}
                            {!! Form::text('title', isset($movie) ? $movie->title : '', [
                                'class' => 'form-control',
                                'placeholder' => 'Nhập dữ liệu...',
                                'id' => 'slug',
                                'onkeyup' => 'ChangeToSlug()',
                            ]) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('Tên Tiếng Anh', 'Tên Tiếng Anh', []) !!}
                            {!! Form::text('name_eng', isset($movie) ? $movie->name_eng : '', [
                                'class' => 'form-control',
                                'placeholder' => 'Nhập dữ liệu...',
                            ]) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('slug', 'Slug', []) !!}
                            {!! Form::text('slug', isset($movie) ? $movie->slug : '', [
                                'class' => 'form-control',
                                'placeholder' => 'Nhập dữ liệu...',
                                'id' => 'convert_slug',
                            ]) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('description', 'Description', []) !!}
                            {!! Form::textarea('description', isset($movie) ? $movie->description : '', [
                                'style' => 'resize:none',
                                'class' => 'form-control',
                                'placeholder' => 'Nhập dữ liệu...',
                                'id' => 'description',
                            ]) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('active', 'Active', []) !!}
                            {!! Form::select('status', ['1' => 'Hiển thị', '0' => 'Ẩn'], isset($movie) ? $movie->status : '', [
                                'class' => 'form-control',
                            ]) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('category', 'Category', []) !!}
                            {!! Form::select('category_id', $category, isset($movie) ? $movie->category : '', ['class' => 'form-control']) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('country', 'Country', []) !!}
                            {!! Form::select('country_id', $country, isset($movie) ? $movie->country : '', ['class' => 'form-control']) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('genre', 'Genre', []) !!}
                            {!! Form::select('genre_id', $genre, isset($movie) ? $movie->genre : '', ['class' => 'form-control']) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('hot', 'Hot', []) !!}
                            {!! Form::select('phim_hot', ['1' => 'Phim Hot', '0' => 'Không'], isset($movie) ? $movie->phim_hot : '', ['class' => 'form-control']) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('Image', 'Image', []) !!}
                            <br>
                            {!! Form::file('image', ['class' => 'form-control-file']) !!}
                            @if (isset($movie))
                                <img width="20%" src="{{ asset('uploads/movie/' . $movie->image) }}">
                            @endif
                        </div>
                        @if (!isset($movie))
                            {!! Form::submit('Thêm dữ liệu', ['class' => 'btn btn-success']) !!}
                        @else
                            {!! Form::submit('Cập nhật dữ liệu', ['class' => 'btn btn-success']) !!}
                        @endif
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
